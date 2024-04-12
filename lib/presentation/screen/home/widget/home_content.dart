import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/image_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/di/injection.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/font_manager.dart';
import '../../../resource/style_manager.dart';
import '../../loading/loading_screen.dart';


class HomeContent extends StatelessWidget {
  const HomeContent({super.key,});

  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences = getIt<AppPreferences>();

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: ValueManager.v65,
          ),
          // Image -------------------------------------------------------------
          FutureBuilder(
            future: appPreferences.getPhoto(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                return CircleAvatar(
                  radius: ValueManager.v100,
                  backgroundImage: NetworkImage(
                    snapshot.data!,
                  ),
                );
              }
              else if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                return const LoadingScreen();
              }
              else if(snapshot.hasError) {
                return Center(
                  child: Text(
                    StringManager.error + snapshot.error.toString(),
                    style: getBoldStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.white,
                    ),
                  ),
                );
              }

              return const CircleAvatar(
                radius: ValueManager.v100,
                backgroundImage: AssetImage(
                  ImageManager.defaultAvatar,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
