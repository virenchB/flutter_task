
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virench_interview_task/constant/app_colors.dart';

class BusinessDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final String phoneNumber;
  final String displayPhoneNumber;
  final String ratingCount;
  final String address1;
  final String city;
  final String state;
  final String zipCode;
  const BusinessDetailScreen({super.key, required this.name, required this.image, required this.phoneNumber, required this.displayPhoneNumber, required this.ratingCount, required this.address1, required this.city, required this.state, required this.zipCode});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Get.height / 1,
            width: double.infinity,
            color: Colors.black,
            child: Image.network(widget.image,fit: BoxFit.cover,),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9)
                ]
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
                ),
                const Spacer(),
                Text("Business Name: ${widget.name}",style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                ),),
                Text("Contact Number 1: ${widget.phoneNumber}",style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                ),),
                Text("Contact Number 2: ${widget.displayPhoneNumber}",style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                ),),
                Text("Rating Count: ${widget.ratingCount}",style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                ),),
                Text("Address: ${widget.address1}, ${widget.city},${widget.zipCode}",style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                ),),
                const SizedBox(height: 16,),
                Container(
alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.orangeColor
                  ),
                  child: const Text("APPLY",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white
                  ),),
                )

              ],
            ),
          ),


        ],
      ),

    );
  }
}
