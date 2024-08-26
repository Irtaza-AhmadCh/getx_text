import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../resources/routes/route_name.dart';
import '../../../utils/notification_massage/ToastMassage.dart';
import '../../getx_controller/loading_controller.dart';
import 'expations/exp.dart';
import '../user_data/user_data.dart';

// AuthResultStatus? _status;

final _auth = FirebaseAuth.instance;
LoadingController controller = Get.find<LoadingController>();


signupAuth(emailController, passwordController,addressController ,context ,nameController,File? image)  {
  _auth.createUserWithEmailAndPassword(email: emailController, password: passwordController).then(
      (_){
        controller.isLoading.value = false;
        Get.toNamed(RouteName.loginScreen);
        Toastmassage.SuccessToast('Account Created SuccessFully');
        userData(nameController, emailController,addressController, image);
      }
  ).onError((error, stackTrace){
    controller.isLoading.value = false;
    Toastmassage.ErrorToast(AuthExceptionHandler.errorMassage(error));  });
}