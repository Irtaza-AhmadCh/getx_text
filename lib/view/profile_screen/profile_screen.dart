import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pro/resources/colors/colors.dart';
import 'package:getx_pro/resources/extentions/extentions.dart';
import 'package:getx_pro/utils/widgets/primary_button.dart';
import 'package:getx_pro/view_model/firebase/auth/logout_auth.dart';
import 'package:getx_pro/view_model/firebase/read_data/read_data_of_profile.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

ReadUserDate();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:            (Get.arguments.isEmpty)?const Text('No data Found'):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
            shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(Get.arguments[0].imageUrl, ),fit: BoxFit.fill),
                border: Border.all(color: Colors.green),
              ),
              
            ),
           20.h,
           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               border: Border.all(color: AppColors.black)
             ),
             width: Get.width *.85,
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children: [
                   Row(
                     children: [
                       const Text('Name: ',
                         overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                         style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w400
                       ),),
                       10.w,
                        SizedBox(
                          width: Get.width*.5,
                          child: Text(Get.arguments[0].name, overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                            ),),
                        ),
                     ],
                   ),
                   Row(
                     children: [
                       const Text('Email: ',
                       overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w400
                       ),),
                       10.w,
                       SizedBox(  width: Get.width*.5,
                         child: Text(Get.arguments[0].email, overflow: TextOverflow.ellipsis,
                           maxLines: 1,
                           style: const TextStyle(
                               fontSize: 15,
                               fontWeight: FontWeight.w400
                           ),),
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       const Text('Address: ',   overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w400
                       ),),
                       10.w,
                       SizedBox(
                         width: Get.width*.5,
                         child: Text(Get.arguments[0].address, overflow: TextOverflow.ellipsis,
                             maxLines: 1,
                             style: const TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.w400
                             ),),
                       ),
                     ],
                   ),
                 ],
               ),
             ),

           ),
            30.h,
            PrimaryButton(lable: 'LogOut', onTap: (){
              logoutAuth(context);
              controller.isLoading.value = false;
            },
            color: AppColors.red,
            width: 200,)
          ],
        ),
      ),
    );
  }
}
