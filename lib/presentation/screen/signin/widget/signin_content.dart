import 'package:flutter/material.dart';
import 'package:google_auth_app/app/constant.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';
import 'package:google_auth_app/presentation/widget/padding_widget.dart';
import 'package:google_auth_app/presentation/widget/title_widget.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/font_manager.dart';
import '../../../resource/image_manager.dart';
import '../../../resource/style_manager.dart';

class SignInContent extends StatefulWidget {
  const SignInContent({super.key});

  @override
  State<SignInContent> createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  //----------------------------------------------------------------------------
  // All content
  //----------------------------------------------------------------------------

  Widget _getContentWidget() => PaddingWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title ---------------------------------------------------------------
        const TitleWidget(
          title: StringManager.signInTitle,
        ),
        const SizedBox(
          height: ValueManager.v30,
        ),
        _googleButtonWidget(),
      ],
    ),
  );

  //----------------------------------------------------------------------------
  // Google button
  //----------------------------------------------------------------------------

  Widget _googleButtonWidget() => GestureDetector(
    child: Padding(
      padding: const EdgeInsets.only(
        left: ValueManager.v16,
        right: ValueManager.v16,
      ),
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
    ),
    onTap: () {
      logger.i("Google button clicked");
    },
  );
}
