import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/font_manager.dart';
import '../resource/image_manager.dart';
import '../resource/string_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';

class GoogleButtonWidget extends StatelessWidget {
  final Function() onPressed;

  const GoogleButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ValueManager.infinity,
        height: ValueManager.v50,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          border: Border.all(
            color: ColorManager.primary,
            width: ValueManager.v2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              ValueManager.v30,
            ),
          ),
        ),
        child: Row(
          children: [
            // Logo --------------------------------------------------------------
            Container(
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    ValueManager.v30,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  ValueManager.v8,
                ),
                child: Image.asset(
                  ImageManager.splashLogo,
                ),
              ),
            ),
            // Title -------------------------------------------------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: ValueManager.v46,
                ),
                child: Text(
                  StringManager.googleButtonTitle,
                  style: getRegularStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
