



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  RxBool emailBool = false.obs;
  RxBool passwordBool = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}