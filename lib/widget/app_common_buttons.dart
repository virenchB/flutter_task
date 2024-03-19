

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/styles.dart';



Widget commonButton({required Color buttonColor, required Color textColor, required double horizontalPadding, required double verticlePadding,required VoidCallback onTap,required double fontSize}){
  return  GestureDetector(
    onTap: onTap,
    child: Container(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticlePadding),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child:  Text("Next",style: TextStyle(
        color: textColor,fontSize: fontSize,fontWeight: FontWeight.bold,fontFamily: AppTextStyle.googleSansFontStyle,
      ),),
    ),
  );
}


Widget loginCommonButton({required Color buttonColor, required Color textColor, required double horizontalPadding, required double verticlePadding,required VoidCallback onTap,required double fontSize,required String title,bool? loading}){
  return  GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticlePadding),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child:  loading == true ? CircularProgressIndicator(color: Colors.white, ) : Text(title,style: TextStyle(
        color: textColor,fontSize: fontSize,fontWeight: FontWeight.bold,fontFamily: AppTextStyle.googleSansFontStyle,
      ),),
    ),
  );
}