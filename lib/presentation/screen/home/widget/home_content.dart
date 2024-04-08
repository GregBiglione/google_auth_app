import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home Screen",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
