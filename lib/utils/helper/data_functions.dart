import 'package:shared_preferences/shared_preferences.dart';

class DataHandler {
  Future<void> setDoubleValue(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<double> getDoubleValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  Future<void> setStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getStringValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<void> setBoolValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBoolValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }


  Future<void> clearAllPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}


// Example usage
// DataHandler.setDoubleValue("doubleValue", 3.14);
// double retrievedDouble = await DataHandler.getDoubleValue("doubleValue");
// print("Retrieved double: $retrievedDouble");
//
