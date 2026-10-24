import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController implements GetxService {
  
  bool isLoading = false;

  TextEditingController transactionSearchController = TextEditingController();
}