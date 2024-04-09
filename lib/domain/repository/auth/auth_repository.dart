import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/state_render.dart';

abstract class AuthRepository {
  User? get user;
  Future<StateRender> googleLogIn();
  Future<void> googleLogOut();
}