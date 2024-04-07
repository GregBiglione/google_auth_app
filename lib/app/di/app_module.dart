import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'firebase_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}