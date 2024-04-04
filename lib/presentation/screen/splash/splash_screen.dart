import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_auth_app/presentation/resource/image_manager.dart';
import 'package:google_auth_app/presentation/resource/route_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/style_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../resource/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  //----------------------------------------------------------------------------
  // Go to Sign In Screen
  //----------------------------------------------------------------------------

  _goToSignInScreen() {
    Navigator.pushReplacementNamed(
      context,
      Routes.signInRoute,
    );
  }

  //----------------------------------------------------------------------------
  // Start timer
  //----------------------------------------------------------------------------

  _startTimer() {
    _timer = Timer(
      const Duration(seconds: 4),
      _goToSignInScreen,
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image -----------------------------------------------------------
            Image.asset(
              ImageManager.splashLogo,
              fit: BoxFit.cover,
              width: ValueManager.v80,
              height: ValueManager.v80,
            ),
            const SizedBox(
              height: ValueManager.v20,
            ),
            // Percent Indicator -----------------------------------------------
            Padding(
              padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width - ValueManager.v150) / 2,
                right: (MediaQuery.of(context).size.width - ValueManager.v150) / 2,
              ),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 2500,
                width: ValueManager.v150,
                lineHeight: ValueManager.v10,
                percent: 1,
                backgroundColor: ColorManager.disableColor,
                progressColor: ColorManager.googleTextColor,
                barRadius: const Radius.circular(
                  ValueManager.v30,
                ),
              ),
            ),
            const SizedBox(
              height: ValueManager.v20,
            ),
            // Title -----------------------------------------------------------
            Text(
              StringManager.appName,
              style: getBoldStyle(
                fontSize: ValueManager.v20,
                color: ColorManager.googleTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
