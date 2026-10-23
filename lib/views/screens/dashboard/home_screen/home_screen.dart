import 'package:flutter/material.dart';
import 'package:vlr/services/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText("Home screen"),
      ),
    );
  }
}