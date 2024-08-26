import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_pro/resources/routes/route_name.dart';
import 'package:getx_pro/view_model/firebase/auth/expations/exp.dart';

import '../../../utils/notification_massage/ToastMassage.dart';
import '../../getx_controller/loading_controller.dart';


final _auth = FirebaseAuth.instance;
LoadingController controller = Get.find<LoadingController>();


logoutAuth(context){
  _auth.signOut().then(
          (_){
            controller.isLoading.value = false;
            Get.offAllNamed(RouteName.loginScreen);
        Toastmassage.SuccessToast('LogOut SuccessFully');
      }
  ).onError((error, stackTrace){
    controller.isLoading.value = false;
    Toastmassage.ErrorToast(AuthExceptionHandler.errorMassage(error));
  });
}