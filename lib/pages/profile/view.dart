import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_chat/common/style/color.dart';
import 'package:v_chat/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_chat/pages/profile/controllers.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
            color: AppColor.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(60.w),
            ),
          ),
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/account_header.png"),
          ),
        ),
        Positioned(
          bottom:0.w,
            right:0.w,
            height:35.w,
            child: GestureDetector(
          child: Container(
            height: 35.h,
            width: 35.w,
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(40.w),
              ),
            ),
            child:Image.asset("assets/icons/edit.png"),
          ),
        ),)
      ],
    );
  }
  Widget _buildCompleteBtn(){
     return GestureDetector(
       child:Container(
         width:295.w,
         height:44.h,
         margin:EdgeInsets.only(top:60.h,bottom:30.h),
         decoration:BoxDecoration(
           color: AppColors.primaryElement,
           borderRadius:const  BorderRadius.all(
             Radius.circular(5),
           ),
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.1),
               spreadRadius: 1,
               blurRadius: 2,
               offset: const Offset(0, 1),
             ),
           ],
         ),
         child:Row(
           mainAxisAlignment:MainAxisAlignment.center,
           children: [
             Text(
               "Complete",
               textAlign:TextAlign.center,
               style: TextStyle(
                   color: AppColors.primaryElementText,
                   fontSize: 14.sp,
                   fontWeight: FontWeight.normal),
             ),
           ],
         ),
       ),
     );
  }
  Widget _buildLogoutBtn(){
    return GestureDetector(
      child:Container(
        width:295.w,
        height:44.h,
        margin:EdgeInsets.only(top:0.h,bottom:30.h),
        decoration:BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child:Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              textAlign:TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      onTap:(){
        Get.defaultDialog(
          title:"Logout",
          content:const Text("Are you sure want to logout"),
          textConfirm:"Confirm",
          textCancel:"Cancel",
          onConfirm:(){
            controller.goLogout();
          },
            onCancel:(){},
          confirmTextColor:Colors.white,
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      _buildProfilePhoto(),
                      _buildCompleteBtn(),
                      _buildLogoutBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
