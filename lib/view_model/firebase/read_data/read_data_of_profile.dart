 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_pro/model/profile_model.dart';
import 'package:getx_pro/utils/notification_massage/ToastMassage.dart';

import '../../../resources/routes/route_name.dart';
import '../auth/expations/exp.dart';
class ReadUserDate{
  List<ProfileModel> allUsers = [];
  List<ProfileModel> currentUser = [];


   readDate()async {
     allUsers.clear();
     currentUser.clear();
    var datebaseRef = await  FirebaseFirestore.instance.collection('User').get();

    try{
      List<ProfileModel> allUsersDate = [];


      datebaseRef.docs.forEach((element){

        ProfileModel  dataModel = ProfileModel(name: element.get('Name'), email: element.get('Email'),
          address: element.get('Address'),  imageUrl: element.get('profileImage'), userId: element.get('Id'), );

        allUsersDate.add(dataModel);

      });

      allUsers = allUsersDate;
     filterUser();

    }catch(e){
      Toastmassage.ErrorToast(AuthExceptionHandler.errorMassage(e));
    }
  }

  filterUser()async {

    currentUser = allUsers.where((user){
      return user.userId.toLowerCase().contains(FirebaseAuth.instance.currentUser!.uid.toLowerCase());
    }).toList();
    if(currentUser.isNotEmpty){
      Get.offAllNamed(RouteName.profileScreen,arguments:  currentUser);
    }
    return currentUser;


  }



}



