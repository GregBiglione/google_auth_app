import 'package:get_it/get_it.dart';
import 'package:google_auth_app/app/app_preferences.dart';
import 'package:google_auth_app/app/di/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await getIt.init();

  // SharedPreferences instance ------------------------------------------------
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // App Preferences instance --------------------------------------------------
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));
}