import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';
import 'package:google_auth_app/presentation/screen/signin/signin_viewmodel.dart';
import 'package:google_auth_app/presentation/widget/google_button_widget.dart';
import 'package:google_auth_app/presentation/widget/padding_widget.dart';
import 'package:google_auth_app/presentation/widget/title_widget.dart';

class SignInContent extends StatefulWidget {
  final SignInViewModel viewModel;

  const SignInContent({super.key, required this.viewModel});

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
        // Google button -------------------------------------------------------
        GoogleButtonWidget(
          onPressed: () {
            widget.viewModel.googleSignIn();
          },
        ),
      ],
    ),
  );
}