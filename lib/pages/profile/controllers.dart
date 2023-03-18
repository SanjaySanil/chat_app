import 'package:google_sign_in/google_sign_in.dart';
import 'package:v_chat/common/routes/names.dart';
import 'package:get/get.dart';
import 'package:v_chat/common/store/user.dart';
import 'package:v_chat/pages/profile/index.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();

  @override
  void onReady() {
    // super.onReady();
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => Get.offAllNamed(AppRoutes.Message),
    // );
  }

  void goLogout()async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
