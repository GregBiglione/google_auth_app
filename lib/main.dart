import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_app/firebase_options.dart';
import 'package:google_auth_app/presentation/resource/route_manager.dart';
import 'package:google_auth_app/presentation/resource/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}

