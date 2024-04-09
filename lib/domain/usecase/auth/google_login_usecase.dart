import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';

class GoogleLogInUseCase {
  final AuthRepository _repository;

  GoogleLogInUseCase(this._repository);

  launch() => _repository.googleLogIn();
}