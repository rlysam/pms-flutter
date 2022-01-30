import 'package:encrypt/encrypt.dart';
import 'dart:convert';

String encrypt(String mapStringToB64MapValue) {
  ///  "{  key: value  }"
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  final key = Key.fromBase64( stringToBase64.encode('my 32 length key................')); //32 char
  final iv = IV.fromBase64(stringToBase64.encode("1234567890123456")); //16 char
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(mapStringToB64MapValue, iv: iv);
  return encrypted.base64;
}

String decrypt(Map mapWith64BitValue) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  final key = Key.fromBase64(stringToBase64.encode('my 32 length key................')); //32 char
  final iv = IV.fromBase64(stringToBase64.encode("1234567890123456")); //16 char
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypted = encrypter.decrypt64(mapWith64BitValue['securedData'], iv: iv);
  return decrypted; //String of JSON
}
