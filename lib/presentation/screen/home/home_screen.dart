import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/font_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/style_manager.dart';
import 'package:google_auth_app/presentation/screen/home/widget/home_content.dart';

import '../../../app/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text(
          StringManager.homeTitle,
          style: getBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logger.i("Logout clicked");
            },
            icon: Icon(
              Icons.logout,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
      backgroundColor: ColorManager.black,
      body: const HomeContent(),
    );
  }
}
