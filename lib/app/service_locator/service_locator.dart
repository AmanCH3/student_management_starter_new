import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import '../../features/auth/presentation/view_model/register_view_model/register_view_model.dart';
import '../../features/batch/presentation/view_model/batch_view_model.dart';
import '../../features/course/presentation/view_model/course_view_model.dart';
import '../../features/home/presentation/view_model/home_view_model.dart';
import '../../features/splash/presentation/view_model/splash_view_model.dart';

final serviceLocator = GetIt.instance ;

Future initDependencies() async {
await _initCourseModule();
await _initBatchModule();
await _initHomeModule();
await _initAuthModule();
await _initSplashModule();
}

Future _initCourseModule() async {
  serviceLocator.registerFactory(() => CourseViewModel());
}

Future _initBatchModule() async {
  serviceLocator.registerFactory(() => BatchViewModel());
}

Future _initHomeModule() async {
  serviceLocator.registerLazySingleton(() => HomeViewModel());
}

Future _initAuthModule() async {
  serviceLocator.registerFactory(() => LoginViewModel());
  serviceLocator.registerFactory(() => RegisterViewModel());
}

Future _initSplashModule() async {
  serviceLocator.registerFactory(() => SplashViewModel());
}