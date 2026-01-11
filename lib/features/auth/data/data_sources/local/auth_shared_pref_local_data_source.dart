import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CacheConstants.token)!;
    } catch (_) {
      throw LocalException('Failed to Save token');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString(CacheConstants.token, token);
    } catch (_) {
      throw LocalException('Failed to get token');
    }
  }
}
