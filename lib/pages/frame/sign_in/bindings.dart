import 'package:v_chat/pages/frame/sign_in/controllers.dart';
import 'package:get/get.dart';

class SignInBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }

}