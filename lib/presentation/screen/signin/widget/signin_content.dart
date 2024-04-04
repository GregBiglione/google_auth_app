import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';

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

  Widget _getContentWidget() => Padding(
    padding: const EdgeInsets.only(
      left: ValueManager.v16,
      right: ValueManager.v16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _signInTitleWidget(),
        const SizedBox(
          height: ValueManager.v30,
        )
      ],
    ),
  );

  //----------------------------------------------------------------------------
  // Title
  //----------------------------------------------------------------------------

  Widget _signInTitleWidget() => Padding(
    padding: const EdgeInsets.only(
      left: ValueManager.v16,
      right: ValueManager.v16,
    ),
    child: Text(
      StringManager.signInTitle,
      style: Theme.of(context).textTheme.displayMedium,
    ),
  );

}
