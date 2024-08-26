import 'package:get/get.dart';
import 'package:getx_pro/resources/routes/route_name.dart';
import 'package:getx_pro/view/profile_screen/profile_screen.dart';
import 'package:getx_pro/view_model/getx_controller/loading_controller.dart';
import 'package:getx_pro/view_model/getx_controller/vistiblity_eye_controller.dart';

import '../../view/login_screen/login_screen.dart';
import '../../view/signup_screen/signup_screen.dart';

class PageRoutes{

  static route() => [
    GetPage(name: RouteName.signScreen, page: ()=>  const SignupScreen(),
        bindings:[ BindingsBuilder((){
          Get.lazyPut(()=>VistiblityEyeController());
        }),
          BindingsBuilder((){
            Get.lazyPut(()=>LoadingController());
          }),

        ]



    ),
    GetPage(name: RouteName.profileScreen, page: ()=>  const ProfileScreen(),
    binding:  BindingsBuilder((){
      Get.lazyPut(()=>LoadingController());
    }),),
    GetPage(name: RouteName.loginScreen, page: ()=>  const LoginScreen(),
      bindings:[ BindingsBuilder((){
          Get.lazyPut(()=>VistiblityEyeController());
        }),
        BindingsBuilder((){
          Get.lazyPut(()=>LoadingController());
        }),

      ]


    ),
  ];
}