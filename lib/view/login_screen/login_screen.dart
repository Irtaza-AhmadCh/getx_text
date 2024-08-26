import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pro/resources/extentions/extentions.dart';
import 'package:getx_pro/view_model/getx_controller/vistiblity_eye_controller.dart';
import '../../resources/colors/colors.dart';
import '../../resources/routes/route_name.dart';
import '../../utils/notification_massage/ToastMassage.dart';
import '../../utils/widgets/primary_button.dart';
import '../../utils/widgets/text-fields.dart';
import '../../view_model/firebase/auth/login_auth.dart';
import '../../view_model/getx_controller/loading_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isLoading= false;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var height = Get.height*(1/812);
  var width = Get.width*(1/375);
  bool errorShown = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  VistiblityEyeController controllers = Get.find<VistiblityEyeController>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
  LoadingController controller = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blue,
        automaticallyImplyLeading: false,

        title: Text('Login', style: TextStyle(
          color: AppColors.white,
          fontSize: 30,
        ),),

      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextField(
                      isVisible: true,
                      title: 'Email',
                      validation: ((controller){
                        if(
                        RegExp(
                          r'^[a-z0-9._%+-]+@(gmail\.com|yahoo\.com|hotmail\.com|outlook\.com|aol\.com)$',
                            caseSensitive: true

                        ).hasMatch(emailController.text)){
                          return null;
                        }else{
                          return 'Enter Valid Email';
                        }
                      }),
                      hintText: 'Enter Email',
                      controller: emailController,),
                    20.h,
                Obx(
                      ()=>  MyTextField(
                        title: 'Password',
                        validation: ((controller){
                          if(passwordController.text.length >=6){
                            return null;
                          }else{
                            return 'Enter atLeast 6 digits';
                          }
                        }),
                        hintText: 'Enter Password',
                        suffixIcon: GestureDetector(onTap: (){
                            controllers.changeVisibilty();
                          },

                            child: (controllers.isVisblity.value)?const Icon(Icons.visibility, color: Colors.grey,):const Icon(Icons.visibility_off, color: Colors.grey,) ,),

                        isVisible: controllers.isVisblity.value,

                        controller: passwordController,),),
                    100.h,
                   Obx(()=> (controller.isLoading.value)?  SizedBox(height: 35, width: 35,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.green,),):
                    PrimaryButton(lable: 'Login', onTap: (){
                      if(_formKey.currentState!.validate()) {
                        controller.isLoading.value = true;
                        if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty ){
                          controller.isLoading.value = true;
                          loginAuth(emailController.text, passwordController.text  ,context );

                        }else{
                          if(errorShown){ Toastmassage.ErrorToast('Fill all data ');}
                          errorShown = false;
                        }
                      }

                    }),),
                    20.h,
                    TextButton(onPressed: (){
                      Get.toNamed(RouteName.signScreen);

                    },
                        isSemanticButton: false,
                        child: Text('SignIn', style: TextStyle(color: AppColors.green),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
