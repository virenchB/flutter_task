import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:virench_interview_task/API/get_bussiness_data_api.dart';
import 'package:virench_interview_task/constant/app_colors.dart';
import 'package:virench_interview_task/screens/login_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    final box = GetStorage();

    Future.delayed(const Duration(seconds: 3),(){
      if(box.read("userEmail")!= null){
        getBusinessesDataAPI();
        Get.offAll(()=> const HomeScreen());

      }else{
        Get.offAll(()=> const LoginScreen());
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.orangeColor,
      body: Center(
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Interview Task",textAlign: TextAlign.center,style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
            ),),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: const Text("Virench",style: TextStyle(
                color: AppColors.orangeColor,fontWeight: FontWeight.bold,fontSize: 30
              ),),
            )
          ],
        ),
      ),
    );
  }
}
