import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_auth_app/app/app_preferences.dart';
import 'package:google_auth_app/app/constant.dart';
import 'package:google_auth_app/app/di/injection.dart';
import 'package:google_auth_app/domain/model/user_data.dart';
import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:google_auth_app/domain/utils/state_render.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

final AppPreferences _appPreferences = getIt<AppPreferences>();
final GoogleSignIn googleSignIn = GoogleSignIn();

class AuthRepositoryImplementer implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final CollectionReference _usersCollection;

  AuthRepositoryImplementer(this._firebaseAuth, this._firestore,
      @Named(USER) this._usersCollection);

  @override
  Future<StateRender> googleLogIn() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    User? user;

    if(googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await _firebaseAuth
            .signInWithCredential(credential);
        _appPreferences.setUserLogged();

        user = userCredential.user;

        // Firestore -----------------------------------------------------------

        final DocumentSnapshot ds = await _firestore
            .collection(USER)
            .doc(user?.uid)
            .get();

        if(!ds.exists) {
          UserData userData = UserData(
            uid: user!.uid,
            name: user.displayName!,
            age: "22",
            city: "Los Angeles",
          );

          await _usersCollection.doc(userData.uid).set(userData.toJson());
        }
      }
      on FirebaseAuthException catch (e) {
        return Error(e.message ?? StringManager.unknownError);
      }
    }

    return Success(user);
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> googleLogOut() async {
    _appPreferences.logout();
    await googleSignIn.signOut();
  }
}