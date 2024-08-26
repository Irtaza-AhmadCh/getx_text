import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:getx_pro/view_model/firebase/read_data/read_data_of_profile.dart';
import 'package:getx_pro/view_model/getx_controller/loading_controller.dart';
import '../../../utils/notification_massage/ToastMassage.dart';
import 'expations/exp.dart';

ReadUserDate  data = ReadUserDate();
LoadingController controller = Get.find<LoadingController>();

final _auth = FirebaseAuth.instance;
loginAuth(email,password, context){
  _auth.signInWithEmailAndPassword(email: email, password: password).then(
          (_){
            data.readDate();
            controller.isLoading.value = false;
        Toastmassage.SuccessToast('LogIn SuccessFully');
      }
  ).onError((error, stackTrace){
    controller.isLoading.value = false;
    controller.isLoading.value = false;

    Toastmassage.ErrorToast(AuthExceptionHandler.errorMassage(error));

  });
}