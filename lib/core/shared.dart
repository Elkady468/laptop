import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? sharedP;
  static init() async {
    sharedP = await SharedPreferences.getInstance();
  }

  static setString({required String key, required String value}) {
    return sharedP!.setString(key, value);
  }

  static getString({required String key}) {
    return sharedP!.getString(key);
  }
}
