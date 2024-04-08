import 'package:flutter/material.dart';
import 'package:google_auth_app/app/function.dart';
import 'package:google_auth_app/domain/utils/state_render.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/screen/loading/loading_screen.dart';
import 'package:google_auth_app/presentation/screen/signin/signin_viewmodel.dart';
import 'package:google_auth_app/presentation/screen/signin/widget/signin_content.dart';
import 'package:provider/provider.dart';

import '../../../app/constant.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInViewModel viewModel = Provider.of<SignInViewModel>(context);

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: StreamBuilder(
        stream: viewModel.response,
        builder: (context, snapshot) {
          final response = snapshot.data;

          if(response is Success) {
            logger.i("User data ${response.data}");
            goToHomeScreen(context);
          }
          else if(response is Loading) {
            logger.w("Loading");
            return const LoadingScreen();
          }
          else if(response is Error) {
            final data = response;
            String error = StringManager.error + data.error;

            errorToast(context, error);
          }

          return SignInContent(viewModel: viewModel,);
        },
      ),
    );
  }
}
