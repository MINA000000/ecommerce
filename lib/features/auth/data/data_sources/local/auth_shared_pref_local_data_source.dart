import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharedPref;

  AuthSharedPrefLocalDataSource(this._sharedPref);

  @override
  Future<String> getToken() async {
    try {
      return _sharedPref.getString(CacheConstants.token)!;
    } catch (_) {
      throw LocalException('Failed to Save token');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await _sharedPref.setString(CacheConstants.token, token);
    } catch (_) {
      throw LocalException('Failed to get token');
    }
  }
}
