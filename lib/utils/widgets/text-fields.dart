import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_pro/view_model/getx_controller/vistiblity_eye_controller.dart';

import '../../resources/colors/colors.dart';


class MyTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool isVisible;
  final Widget? suffixIcon;
  final validation;
  const MyTextField({super.key, required this.title,
    required this.controller, required this.hintText,
    this.suffixIcon, required this.isVisible, this.validation,   });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  VistiblityEyeController controllers = Get.find<VistiblityEyeController>();

  @override
  Widget build(BuildContext context) {

    return
     Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(widget.title,style:  TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  color: AppColors.black
              ),),
             TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
               validator: widget.validation,
               obscureText: !widget.isVisible,
                      obscuringCharacter: '*',
                      style:  TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: AppColors.black
                      ),
                      controller: widget.controller,
                      cursorErrorColor: AppColors.red,

                      decoration:  InputDecoration(

                        hintText: widget.hintText,

                        hintStyle:  const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: Colors.black
                        ),
                        suffixIcon: widget.suffixIcon,
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                            borderSide:BorderSide(color: Color(0xffE7E8EA))
                        ),
                        disabledBorder:   OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                            borderSide:BorderSide(color: Color(0xffE7E8EA))
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:BorderSide(color: AppColors.blue),
                        ),
                        errorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                            borderSide:BorderSide(color: AppColors.red)
                        ),
                        focusedErrorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                            borderSide:BorderSide(color: AppColors.red)
                        ),

                      )
              )
            ]);
  }
}
