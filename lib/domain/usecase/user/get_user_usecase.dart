import 'package:google_auth_app/domain/repository/user/user_repository.dart';

class GetUserUseCase {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  launch(String uid) => _repository.getUser(uid);
}