import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  // variable of type shared prefernces
  static late SharedPreferences sharedPreferences;

  // init function to get instance of shared prefernces
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Save Data
  Future<bool> saveData({
    required String key,
    required dynamic value,
    required int id,
  }) async {
    final newKey = "$key$id";

    if (value is int) {
      return await sharedPreferences.setInt(newKey, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(newKey, value);
    } else if (value is String) {
      return await sharedPreferences.setString(newKey, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(newKey, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(newKey, value);
    }

    throw Exception("Unsupported data type");
  }

  // Get Data
  dynamic getData({required String key, required int id}) {
    final newKey = "$key$id";
    return sharedPreferences.get(newKey);
  }

  // remove data
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // clear data
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  // conains data  => check the key
  bool containsData({required String key}) {
    return sharedPreferences.containsKey(key);
  }
}
