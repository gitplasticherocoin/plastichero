import 'package:encrypt/encrypt.dart';



class AESHelper {
  static final String key = "";

  String getTimeStampString() {
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    return timestamp.toString().padLeft(16, '0');
  }

  /// @return  data, iv
  Map<String,String> encrypt(String data) {
    final key = Key.fromUtf8(AESHelper.key);
    final timestamp = getTimeStampString();
    final iv = IV.fromUtf8(timestamp);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);
    Map<String,String> result = Map<String,String>();
    result['data'] = encrypted.base64;
    result["iv"] =  timestamp;
    return result;
  }

  String encryptFromTimestamp(String data, String timestamp) {
    final key = Key.fromUtf8(AESHelper.key);
    final iv = IV.fromUtf8(timestamp);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String data, String timestamp) {
    final key = Key.fromUtf8(AESHelper.key);
    final iv = IV.fromUtf8(timestamp);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final de = encrypter.decrypt64(data , iv: iv );
    return de;
  }
}

