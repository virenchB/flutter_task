



import 'package:get/get.dart';

import '../model/bussiness_data_model.dart';

class BusinessesController extends GetxController{
  RxBool loading = false.obs;
  RxList<Business> businessesList = <Business>[].obs;

}