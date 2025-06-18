import 'package:hive_flutter/hive_flutter.dart';
import 'package:nawel/Features/Auth/data/models/user_model.dart';

class HiveService {
  static const String userBoxName = 'userBox';
  static const String userKey = 'currentUser';
  static const String onboardingKey = 'isOnBoardingViewSeen';
  static Box<UserModel>? _userBox;
  static Box<bool>? _settingsBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    _userBox = await Hive.openBox<UserModel>(userBoxName);
    _settingsBox = await Hive.openBox<bool>('settings');
  }

  static Box<UserModel> getUserBox() {
    if (_userBox == null) {
      throw Exception('HiveService not initialized. Call init() first.');
    }
    return _userBox!;
  }

  static Box<bool> getSettingsBox() {
    if (_settingsBox == null) {
      throw Exception('HiveService not initialized. Call init() first.');
    }
    return _settingsBox!;
  }

  static Future<void> saveUser(UserModel user) async {
    final box = getUserBox();
    await box.put(userKey, user);
  }

  static UserModel? getUser() {
    final box = getUserBox();
    return box.get(userKey);
  }

  static Future<void> deleteUser() async {
    final box = getUserBox();
    await box.delete(userKey);
  }

  static bool isOnBoardingViewSeen() {
    return getSettingsBox().get(onboardingKey) ?? false;
  }

  static Future<void> setOnBoardingViewSeen(bool value) async {
    await getSettingsBox().put(onboardingKey, value);
  }
}
