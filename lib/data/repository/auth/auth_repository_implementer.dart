import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_auth_app/app/app_preferences.dart';
import 'package:google_auth_app/app/di/injection.dart';
import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:google_auth_app/domain/utils/state_render.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

final AppPreferences _appPreferences = getIt<AppPreferences>();

class AuthRepositoryImplementer implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementer(this._firebaseAuth);

  @override
  Future<StateRender> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
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
      }
      on FirebaseAuthException catch (e) {
        return Error(e.message ?? StringManager.unknownError);
      }
    }

    return Success(user);
  }

  @override
  User? get user => _firebaseAuth.currentUser;
}