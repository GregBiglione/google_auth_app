import 'package:google_auth_app/domain/usecase/auth/user_session_usecase.dart';

import 'google_login_usecase.dart';
import 'google_logout_usecase.dart';

class AuthUseCase {
  final UserSessionUseCase userSessionUseCase;
  final GoogleLogInUseCase googleLogInUseCase;
  final GoogleLogOutUseCase googleLogOutUseCase;

  AuthUseCase({required this.userSessionUseCase,
    required this.googleLogInUseCase, required this.googleLogOutUseCase});
}