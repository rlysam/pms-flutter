import 'package:encrypt/encrypt.dart';
import 'dart:convert';

String encrypt(String mapStringToB64MapValue) {
  ///  "{  key: value  }"
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  final key = Key.fromBase64( stringToBase64.encode('me%sQ%xs6rn4MWMYs4!&5Qhsh%VbZ^6d')); //32 char
  final iv = IV.fromBase64(stringToBase64.encode(r"2&4HSYK9RKk$$Bzu")); //16 char
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(mapStringToB64MapValue, iv: iv);
  return encrypted.base64;
}

String decrypt(String b64String) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  final key = Key.fromBase64(stringToBase64.encode(r'me%sQ%xs6rn4MWMYs4!&5Qhsh%VbZ^6d')); //32 char
  final iv = IV.fromBase64(stringToBase64.encode(r"2&4HSYK9RKk$$Bzu")); //16 char
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypted = encrypter.decrypt64(b64String, iv: iv);
  return decrypted; //String of JSON
}
