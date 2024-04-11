import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/image_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';

import '../../../../app/constant.dart';

class HomeContent extends StatelessWidget {
  final User user;

  const HomeContent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    logger.e("Photo URL: ${user.photoURL}");

    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: ValueManager.v65,
          ),
          // Image -------------------------------------------------------------
          CircleAvatar(
            radius: ValueManager.v100,
            backgroundImage: AssetImage(
              ImageManager.defaultAvatar,
            ),
          ),
        ],
      ),
    );
  }
}
