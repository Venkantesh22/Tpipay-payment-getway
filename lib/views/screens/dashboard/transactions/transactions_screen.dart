import 'package:flutter/material.dart';
import 'package:vlr/services/custom_text.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText("Transaction screen"),
      ),
    );
  }
}