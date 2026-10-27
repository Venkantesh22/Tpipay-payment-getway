import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/data/repositories/bank_repo.dart';

class BankController extends GetxController implements GetxService {
  final BankRepo bankRepo;

  BankController({
    required this.bankRepo,
  });

  final TextEditingController accountHolderNameController =
      TextEditingController();

  final TextEditingController bankNameController = TextEditingController();

  final TextEditingController accountNoController = TextEditingController();

  final TextEditingController confirmAccountNoController =
      TextEditingController();

  final TextEditingController ifscCodeController = TextEditingController();

  @override
  void onClose() {
    accountHolderNameController.dispose();
    bankNameController.dispose();
    accountNoController.dispose();
    confirmAccountNoController.dispose();
    ifscCodeController.dispose();

    super.onClose();
  }
}
