import 'package:get/get.dart';
import 'package:v_chat/pages/profile/controllers.dart';

class ProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}