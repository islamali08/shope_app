import 'package:shared_preferences/shared_preferences.dart';

class cashhelper {


  static SharedPreferences? sharedprefrance;

  static init() async {
    sharedprefrance = await SharedPreferences.getInstance();
  }

  static Future <bool> savedata
      ({
    required String key,
    required dynamic value

  }) async {
    if (value is String)
      return await sharedprefrance!.setString(key, value);
    if (value is bool)
      return await sharedprefrance!.setBool(key, value);
    if (value is int)
      return await sharedprefrance!.setInt(key, value);

      return await sharedprefrance!.setDouble(key, value);


  }
static dynamic getdata(
  {
  required String key
}
    )  {

    return sharedprefrance!.get(key);


}

static Future<bool> removedata(
  {
  required String key,
}
    )async{

   return await sharedprefrance!.remove(key);


}


}