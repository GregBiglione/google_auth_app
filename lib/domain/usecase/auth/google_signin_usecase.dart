import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository _repository;

  GoogleSignInUseCase(this._repository);

  launch() => _repository.googleSignIn();
}