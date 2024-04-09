import 'package:google_auth_app/domain/usecase/auth/user_session_usecase.dart';

import 'google_signin_usecase.dart';

class AuthUseCase {
  final UserSessionUseCase userSessionUseCase;
  final GoogleSignInUseCase googleSignInUseCase;

  AuthUseCase({required this.userSessionUseCase,
    required this.googleSignInUseCase});
}