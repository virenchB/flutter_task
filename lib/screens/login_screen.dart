import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:virench_interview_task/API/get_bussiness_data_api.dart';
import 'package:virench_interview_task/controller/login_controller.dart';
import 'package:virench_interview_task/screens/home_screen.dart';

import '../constant/app_colors.dart';
import '../constant/app_image_path.dart';
import '../widget/app_common_buttons.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Image.asset("${AppImagePath.signUpImagePath}top_design.png",color: AppColors.orangeColor,),
              const Spacer(),
              Image.asset("${AppImagePath.loginImagePath}bottom design.png",color: AppColors.orangeColor,),


            ],
          ),
         Obx(()=>  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text("Welcome",style: TextStyle(
                 color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "Times New Roman"
             ),

             ),
             const SizedBox(height: 20,),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               margin: const EdgeInsets.symmetric(horizontal: 20),
               height: 50,
               width: double.infinity,
               decoration: BoxDecoration(
                   border: Border.all(color:loginController.emailBool.value ? Colors.red : Colors.transparent),
                   borderRadius: BorderRadius.circular(8),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.withOpacity(0.1),
                         spreadRadius: 5,
                         blurRadius: 5,
                         offset: const Offset(3,3)
                     )
                   ]
               ),
               child:  TextField(

                 controller: loginController.emailController,
                 decoration: const InputDecoration(
                     hintText: "Email",
                     border: InputBorder.none
                 ),
               ),
             ),
            loginController.emailBool.value ?  SizedBox(height: 10,) : SizedBox(),
           loginController.emailBool.value ?   Text("Please enter Your Email",style: TextStyle(
               color: Colors.red
           ),) : SizedBox(),
             const SizedBox(height: 15,),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               margin: const EdgeInsets.symmetric(horizontal: 20),
               height: 50,
               width: double.infinity,
               decoration: BoxDecoration(
                   border: Border.all(color: loginController.passwordBool.value ? Colors.red : Colors.transparent),
                   borderRadius: BorderRadius.circular(8),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.grey.withOpacity(0.1),
                         spreadRadius: 5,
                         blurRadius: 5,
                         offset: const Offset(3,3)
                     )
                   ]
               ),
               child:   Row(
                 children: [
                   Expanded(
                     child: TextField(
                       controller: loginController.passwordController,
                       decoration: const InputDecoration(
                           hintText: "Password",
                           border: InputBorder.none
                       ),
                     ),
                   ),
                   const Icon(Icons.remove_red_eye,color: Colors.black12,size: 20,),
                 ],
               ),
             ),
             loginController.passwordBool.value ?  SizedBox(height: 10,) : SizedBox(),
             loginController.passwordBool.value ?   Text("Please enter Password",style: TextStyle(
                 color: Colors.red
             ),) : SizedBox(),
             const SizedBox(height: 25,),
             const Text("Forgot your password?",style: TextStyle(
                 color: AppColors.darkGreyColor,fontSize: 13
             ),),
             const SizedBox(height: 20,),
             loginCommonButton(buttonColor: AppColors.orangeColor,horizontalPadding: 0,verticlePadding: 10,loading: false,onTap: (){
               if(loginController.emailController.text.isEmpty){
                 loginController.emailBool.value = true;
               }else if(loginController.passwordController.text.isEmpty){
                 loginController.passwordBool.value = true;
               }else{
                 loginController.emailBool.value = false;
                 loginController.passwordBool.value = false;
                 getBusinessesDataAPI();
                 final box = GetStorage();
                 box.write("userEmail", loginController.emailController.text);
                 Get.offAll(()=> const HomeScreen());
               }
             },textColor: Colors.white,fontSize: 20,title: "Login",),
             const SizedBox(height: 20,),
             const Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Don't have an account?",style: TextStyle(
                     color: AppColors.darkGreyColor,fontSize: 13
                 ),),
                 Text(" Sign Up",style: TextStyle(
                     color: AppColors.orangeColor,fontSize: 13,fontWeight: FontWeight.bold
                 ),),
               ],
             ),
             const SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                   decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                             color: Colors.grey.withOpacity(0.1),
                             spreadRadius: 5,
                             blurRadius: 5,
                             offset: const Offset(3,3)
                         )
                       ],
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(15)
                   ),
                   child: Image.asset("${AppImagePath.loginImagePath}fb.png",height: 30,width: 30,),
                 ),
                 const SizedBox(width: 25,),
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                   decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                             color: Colors.grey.withOpacity(0.1),
                             spreadRadius: 5,
                             blurRadius: 5,
                             offset: const Offset(3,3)
                         )
                       ],
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(15)
                   ),
                   child: Image.asset("${AppImagePath.loginImagePath}google.png",height: 30,width: 30,),
                 )
               ],
             ),
           ],
         ))
        ],
      ),
    );

  }
}
