import 'package:get/get.dart';
import 'package:vlr/data/repositories/bank_repo.dart';

class BankController extends GetxController implements GetxService {
  final BankRepo bankRepo;

  BankController({required this.bankRepo});
}
