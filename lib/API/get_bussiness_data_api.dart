import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:virench_interview_task/controller/businesses_controller.dart';
import 'package:virench_interview_task/model/bussiness_data_model.dart';


getBusinessesDataAPI()async{
BusinessesController businessesController = Get.put(BusinessesController());
businessesController.loading.value = true;
  var headers = {
    'Authorization': 'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'
  };
  var request = http.Request('GET', Uri.parse('https://api.yelp.com/v3/businesses/search?location=NYC'));

  request.headers.addAll(headers);

  http. Response response = await http.Response.fromStream(await request.send());
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    businessesController.loading.value = false;
businessesController.businessesList.value = businessDataModelFromJson(response.body).businesses!;
  }
  else {
businessesController.loading.value = false;
  }
}