import 'package:v_chat/common/entities/user.dart';
import 'package:v_chat/common/routes/names.dart';
import 'package:v_chat/common/store/store.dart';
import 'package:v_chat/common/utils/http.dart';
import 'package:v_chat/pages/frame/sign_in/index.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ["openid"],
  );

  Future<void> handleSingIn(String type) async {
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("your are login with phone number");
        }
      } else if (type == "google") {
        var user=await _googleSignIn.signIn();
        if(user!=null){
          String ? displayName =user.displayName;
          String email=user.email;
          String id =user.id;
          String userUrl=user.photoUrl??"assets/icons/google.png";
          LoginRequestEntity loginPanelRequestEntity  =LoginRequestEntity();
          loginPanelRequestEntity.avatar=userUrl;
          loginPanelRequestEntity.name=displayName;
          loginPanelRequestEntity.email=email;
          loginPanelRequestEntity.open_id=id;
          loginPanelRequestEntity.type=2;
          asyncPostAllData();
        }
      } else {
        if (kDebugMode) {
          print("...login type not sure..");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("error while login ${e}");
      }
    }
  }
  asyncPostAllData() async {

    UserStore.to.setIsLogin=true;
   Get.offAllNamed(AppRoutes.Message);
  }
}
