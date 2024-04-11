import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/image_manager.dart';
import 'package:google_auth_app/presentation/resource/value_manager.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
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
