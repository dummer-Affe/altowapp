import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/states/app_user/auth_user.dart';

enum SharedKeys { appearance, authUser }

class SharedPreferencesManager {
  SharedPreferences? preferences;

  SharedPreferencesManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUserInformations(AuthUserInformations user) async {
    final item = jsonEncode(user.toJson());
    await saveString(SharedKeys.authUser, item);
  }

  Future<void> forgetUserInformations() async {
    await removeItem(SharedKeys.authUser);
  }

  AuthUserInformations? getUserInformations() {
    final itemEncoded = getString(SharedKeys.authUser);
    if (itemEncoded == null) {
      return null;
    }
    final json = jsonDecode(itemEncoded);
    if (json is Map<String, dynamic>) {
      return AuthUserInformations.fromJson(json);
    }
    return null;
  }

  Future<void> updateAppearance(String name) async {
    await saveString(SharedKeys.appearance, name);
  }

  String? get getAppearance {
    return getString(SharedKeys.appearance);
  }

  Future<void> saveBool(SharedKeys key, bool value) async {
    await preferences?.setBool(key.name, value);
  }

  bool? getBool(SharedKeys key) {
    return preferences?.getBool(key.name);
  }

  Future<void> saveInt(SharedKeys key, int value) async {
    await preferences?.setInt(key.name, value);
  }

  int? getInt(SharedKeys key) {
    return preferences?.getInt(key.name);
  }

  Future<void> saveDouble(SharedKeys key, double value) async {
    await preferences?.setDouble(key.name, value);
  }

  double? getDouble(SharedKeys key) {
    return preferences?.getDouble(key.name);
  }

  Future<void> saveString(SharedKeys key, String value) async {
    await preferences?.setString(key.name, value);
  }

  Future<void> setStringList(SharedKeys key, List<String> list) async {
    await preferences?.setStringList(key.name, list);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringList(SharedKeys key) {
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return (await preferences?.remove(key.name)) ?? false;
  }
  
}
