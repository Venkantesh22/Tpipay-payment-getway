import 'package:flutter/material.dart';
import 'package:vlr/services/custom_text.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText("Action screen"),
      ),
    );
  }
}