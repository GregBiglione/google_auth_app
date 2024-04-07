import '../../utils/state_render.dart';

abstract class AuthRepository {
  Future<StateRender> googleSignIn();
}