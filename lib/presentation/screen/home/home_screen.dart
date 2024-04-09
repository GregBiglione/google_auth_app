import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_auth_app/app/function.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/font_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/style_manager.dart';
import 'package:google_auth_app/presentation/screen/home/home_viewmodel.dart';
import 'package:google_auth_app/presentation/screen/home/widget/home_content.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              viewModel.googleLogOut();
              logoutNavigation(context);
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
