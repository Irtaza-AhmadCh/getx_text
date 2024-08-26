import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pro/resources/extentions/extentions.dart';
import 'package:getx_pro/view_model/getx_controller/vistiblity_eye_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../resources/colors/colors.dart';
import '../../resources/routes/route_name.dart';
import '../../utils/notification_massage/ToastMassage.dart';
import '../../utils/widgets/primary_button.dart';
import '../../utils/widgets/text-fields.dart';
import '../../view_model/firebase/auth/signUp_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
bool isDisabled= false;
class _SignupScreenState extends State<SignupScreen> {
  var height = Get.height*(1/812);
  final _formKey = GlobalKey<FormState>();

  var width = Get.width*(1/375);
  bool errorShown = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  VistiblityEyeController controllers = Get.find<VistiblityEyeController>();

  File? _image ;
  final picker = ImagePicker();


  Future<void> pickImage() async{

    final  pickedImage =  await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      setState(() {
        _image = File(pickedImage.path);

        if(_image!= null){
          debugPrint('image is ${pickedImage.path}');

        }
      });
    }else{
      Toastmassage.ErrorToast('No Image is selected');
    }}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
  }

    @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.blue,
          title: Text('Signup', style: TextStyle(
            color: AppColors.white,
            fontSize: 30,
          ),),
      automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (kIsWeb)? const Text('No preview'):Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: (_image !=null ) ?DecorationImage(image: FileImage(_image!),fit: BoxFit.fill): null,
                        border: Border.all(color: Colors.green),
                      ),

                    ) ,
                    20.h,
                    PrimaryButton(lable: 'Pick Image', onTap: (){
                      pickImage();
                    },
                      width: 200*width,
                    color: AppColors.blue,),
                    MyTextField(
                      isVisible: true,
                      validation: ((contriller){
                        if(nameController.text.isNotEmpty){
                          return null;
                        }else{
                          return 'Enter atLeast one word';
                        }
                      }),
                      title: 'Name',
                      hintText: 'Enter Name',
                      controller: nameController,),
                    20.h,
                    MyTextField(
                      isVisible: true,
                      title: 'Email',
                      validation: ((contriller){
                        if( RegExp(
                          r'^[a-z0-9._%+-]+@(gmail\.com|yahoo\.com|hotmail\.com|outlook\.com|aol\.com)$',
                          caseSensitive: true
                        )
                            .hasMatch(emailController.text)){
                          return null;
                        }else{
                          return 'Enter Valid Email';
                        }
                      }),
                      hintText: 'Enter Email',
                      controller: emailController,),
                    20.h,
                Obx(
                      ()=> MyTextField(

                        isVisible: controllers.isVisblity.value,
                        title: 'Password',
                        validation: ((contriller){
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
                        controller: passwordController,),
                    ),
                    20.h,
                    MyTextField(
                      isVisible: true,

                      title: 'Address',
                      hintText: 'Enter Address',
                      validation: ((contriller){
                        if(addressController.text.isNotEmpty){
                          return null;
                        }else{
                          return 'Enter atLeast one word ';
                        }
                      }),
                      controller: addressController,),
                    (Get.height*.05).h,
                Obx(()=> (controller.isLoading.value)? SizedBox(height: 35, width: 35,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.green,),):
                PrimaryButton(lable: 'Signup', onTap: (){

                       if(_formKey.currentState!.validate() &&
                       _image != null) {
                         controller.isLoading.value = true;

                           signupAuth(
                               emailController.text, passwordController.text,
                               addressController.text, context,
                               nameController.text, _image!);
                         } else {
                           if (errorShown) {
                             Toastmassage.ErrorToast('Fill all data');
                             errorShown = false;
                           }

                         }
                       } ),
                   ),
                    10.h,
                    TextButton(onPressed: (){
                      Get.toNamed(RouteName.loginScreen);

                    },
                        isSemanticButton: true,
                        child: Text('Login', style: TextStyle(color: AppColors.green),))
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
