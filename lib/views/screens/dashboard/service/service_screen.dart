import 'package:flutter/material.dart';
import 'package:vlr/services/custom_text.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText("service screen"),
      ),
    );
  }
}