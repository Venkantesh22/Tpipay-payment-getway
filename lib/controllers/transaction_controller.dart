import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/views/screens/dashboard/transactions/widget/status_row_secton/transaction_status_widget.dart';

class TransactionController extends GetxController implements GetxService {
  bool isLoading = false;

  TextEditingController transactionSearchController = TextEditingController();

  int selectTransactionStatus = 1;

  void updateTransactionStatus({required int id}) {
    selectTransactionStatus = id;

    update();
  }

  List<TransactionStatusModel> transactionStatusModelList = [
    TransactionStatusModel(title: "All", id: 1),
    TransactionStatusModel(title: "Success", id: 2),
    TransactionStatusModel(title: "Pending", id: 3),
    TransactionStatusModel(title: "Failed", id: 4),
    TransactionStatusModel(title: "Refund", id: 5),
  ];

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController minAmountSearchController = TextEditingController();
  TextEditingController maxAmountSearchController = TextEditingController();

  @override
  void dispose() {
    transactionSearchController.dispose();
    toDateController.dispose();
    fromDateController.dispose();
    minAmountSearchController.dispose();
    maxAmountSearchController.dispose();

    super.dispose();
  }
}
