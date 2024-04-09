import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';

class GoogleLogOutUseCase {
  final AuthRepository _repository;

  GoogleLogOutUseCase(this._repository);

  launch() => _repository.googleLogOut();
}