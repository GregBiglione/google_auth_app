import 'package:flutter/material.dart';
import 'package:google_auth_app/app/di/injection.dart';
import 'package:google_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:google_auth_app/main.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/route_manager.dart';
import 'package:toastification/toastification.dart';

// Error toast -----------------------------------------------------------------

void errorToast(BuildContext context, String message) => toastification.show(
  context: context,
  title: Text(message),
  autoCloseDuration: const Duration(seconds: 2),
  type: ToastificationType.error,
  style: ToastificationStyle.fillColored,
  showProgressBar: false,
  alignment: Alignment.bottomCenter,
  backgroundColor: ColorManager.error,
);

// Go to home screen -----------------------------------------------------------

void goToHomeScreen(BuildContext context) => WidgetsBinding.instance
    .addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(
        context,
        Routes.homeRoute,
      );
});

// Go to main after logout -----------------------------------------------------

void logoutNavigation(BuildContext context) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(getIt<AuthUseCase>()),
      ),
      (route) => false,
);