import 'package:flutter_test/flutter_test.dart';

import 'package:plastichero/plastichero.dart';
import 'package:encrypt/encrypt.dart';
void main() {

  test("암호화 테스트", () {
      String word = "plastichero";
      final aes = AESHelper();
      final result  = aes.encrypt(word);
      print(result["data"]);
      print(result["iv"]);
      String de = aes.decrypt(result["data"]!, result["iv"]!);
      expect(de, word);
  });
}
