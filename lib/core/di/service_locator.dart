import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton(
    AuthCubit(
      AuthRepository(
        AuthApiRemoteDataSource(),
        AuthSharedPrefLocalDataSource(),
      ),
    ),
  );
}
