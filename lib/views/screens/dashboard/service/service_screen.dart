import 'package:flutter/material.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/appbar_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Center(
        child: CustomText("service screen"),

      ),
    );
  }
}