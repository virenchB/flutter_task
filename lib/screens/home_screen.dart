import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virench_interview_task/constant/app_colors.dart';
import 'package:virench_interview_task/controller/businesses_controller.dart';
import 'package:virench_interview_task/screens/business_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BusinessesController businessesController = Get.put(BusinessesController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  backgroundColor: AppColors.orangeColor,
  title: const Text("Business List",style: TextStyle(
    color: Colors.white,fontWeight: FontWeight.bold
  ),),
),
      body: Obx(()=> businessesController.loading.value ? const Center(child: CircularProgressIndicator(color: AppColors.orangeColor)) : ListView.separated(
        padding: const EdgeInsets.only(top: 16,bottom: 16),
        shrinkWrap: true,
        itemCount: businessesController.businessesList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){

              Get.to(()=> BusinessDetailScreen(name: businessesController.businessesList[index].name ?? "", image:  businessesController.businessesList[index].imageUrl ?? "", phoneNumber:  businessesController.businessesList[index].phone ?? "", displayPhoneNumber:  businessesController.businessesList[index].displayPhone ?? "",ratingCount: businessesController.businessesList[index].reviewCount.toString(),address1: businessesController.businessesList[index].location!.address1 ?? "",city:  businessesController.businessesList[index].location!.city ?? "",state:  businessesController.businessesList[index].location!.state.toString(),zipCode:  businessesController.businessesList[index].location!.zipCode?? "",));
            },
            child: Container(

              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 16),

              width: double.infinity,
              decoration: BoxDecoration(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(businessesController.businessesList[index].imageUrl!),fit: BoxFit.cover
                ),
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(8)
              ),

            ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(businessesController.businessesList[index].name ?? "",style: const TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
                            ),),
                            Text(businessesController.businessesList[index].phone ?? "",style: const TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
                            ),),
                            Text("Rating: ${businessesController.businessesList[index].rating}",style: const TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
                            ),),
                             Row(
                              children: [
                                const Text("States: ",style: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                              businessesController.businessesList[index].isClosed == true ?   const Text("Close",style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)) :   const Text("Open",style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,)
                    ],
                  ),
                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20,);
      },),)
    );
  }
}
