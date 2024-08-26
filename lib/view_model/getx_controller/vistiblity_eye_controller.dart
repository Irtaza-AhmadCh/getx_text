
import 'package:get/get.dart';

class VistiblityEyeController extends GetxController{
  RxBool isVisblity =  false.obs;

  void changeVisibilty (){
    isVisblity.value = !isVisblity.value;
  }
}
