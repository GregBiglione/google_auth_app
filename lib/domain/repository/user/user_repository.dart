import 'package:google_auth_app/domain/model/user_data.dart';

import '../../utils/state_render.dart';

abstract class UserRepository {
  Stream<StateRender<UserData>> getUser(String uid);
}