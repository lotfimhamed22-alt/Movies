import 'package:get_it/get_it.dart';
import 'package:movies/core/shared_pref/cach_helper.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<CachHelper>(() => CachHelper());
}
