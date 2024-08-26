import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../resources/colors/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String lable;
  final VoidCallback onTap;
  final Color? color;
  final double? height;
  final double? width;
  const PrimaryButton({super.key, required this.lable, required this.onTap,  this.color,  this.height,  this.width});

  @override
  Widget build(BuildContext context) {
    var getHeight = Get.height*(1/812);
    var getWidth = Get.width*(1/375);

    return   GestureDetector(
      onTap: onTap,
      child: Container(
        width:width ?? getWidth*300,
        height: height??  getHeight*45,
        decoration: BoxDecoration(
          color: color ?? AppColors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(lable , style:  TextStyle(
            color: AppColors.white,
            fontSize: 15,
          ),),
        ),
      ),
    );
  }
}
