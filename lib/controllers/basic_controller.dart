import 'package:get/get.dart';
import 'package:vlr/data/repositories/basic_repo.dart';
import 'package:vlr/views/base/custom_image.dart';

class BasicController extends GetxController implements GetxService {
  final BasicRepo basicRepo;

  BasicController({required this.basicRepo});
  
  bool isLoading = false;

  List<String>  sliders = [
  Assets.imagesBanner1, 
  ]; 
  
}