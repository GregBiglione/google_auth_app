import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_auth_app/domain/repository/auth/auth_repository.dart';

class UserSessionUseCase {
  final AuthRepository _repository;

  UserSessionUseCase(this._repository);

  User? get userSession => _repository.user;
}