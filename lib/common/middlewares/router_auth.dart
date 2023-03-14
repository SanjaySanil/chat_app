import 'package:flutter/material.dart';
import 'package:v_chat/common/routes/routes.dart';
import 'package:v_chat/common/store/store.dart';

import 'package:get/get.dart';

/// check if the user is logged in
class RouteAuthMiddleware extends GetMiddleware {
  // priority smaller the better
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 2), () => Get.snackbar("Tips", "Login expired, please login again!"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}