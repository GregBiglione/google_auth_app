import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_auth_app/app/function.dart';
import 'package:google_auth_app/domain/model/user_data.dart';
import 'package:google_auth_app/domain/utils/state_render.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/font_manager.dart';
import 'package:google_auth_app/presentation/resource/string_manager.dart';
import 'package:google_auth_app/presentation/resource/style_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';
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
        title: StreamBuilder(
          stream: viewModel.getUser(),
          builder: (context, snapshot) {
            final response = snapshot.data;

            if(response is Success) {
              final user = response as Success<UserData>;

              return Text(
                StringManager.homeTitle + user.data.name,
                style: getBoldStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),
                overflow: TextOverflow.ellipsis,
              );
            }
            else if(response is Loading) {
              return SpinKitFadingCircle(
                color: ColorManager.white,
                size: ValueManager.v40,
              );
            }
            else if(response is Error) {
              final data = response as Error;

              return Center(
                child: Text(
                  StringManager.error + data.error,
                  style: getBoldStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }

            return const SizedBox();
          },
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
