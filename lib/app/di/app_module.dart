import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_auth_app/data/repository/auth/auth_repository_implementer.dart';
import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:google_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:google_auth_app/domain/usecase/auth/google_signin_usecase.dart';
import 'package:google_auth_app/domain/usecase/auth/user_session_usecase.dart';
import 'package:injectable/injectable.dart';

import 'firebase_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // Repository ----------------------------------------------------------------

  @injectable
  AuthRepository get authRepository => AuthRepositoryImplementer(firebaseAuth);

  // Use case ------------------------------------------------------------------

  @injectable
  AuthUseCase get authUseCase => AuthUseCase(
    userSessionUseCase: UserSessionUseCase(authRepository),
    googleSignInUseCase: GoogleSignInUseCase(authRepository), 
  );
}