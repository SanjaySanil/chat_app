import 'package:v_chat/common/routes/pages.dart';
import 'package:v_chat/common/style/style.dart';
import 'package:v_chat/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(const MyApp());
 await Global.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360, 780),
      builder: (context, child) => GetMaterialApp(
        theme:AppTheme.light,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
