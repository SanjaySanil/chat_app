import 'package:v_chat/common/entities/entities.dart';
import 'package:v_chat/common/utils/utils.dart';

class ContactAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ContactResponseEntity> post_contact() async {
    var response = await HttpUtil().post(
      'api/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }


}
