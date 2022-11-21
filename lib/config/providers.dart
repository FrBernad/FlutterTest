import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_picker/config/http_clients/dio_interceptor.dart';

import '../flavors.dart';
import 'env/env.dart';

///
/// Env Dependencies
///
final envProvider = Provider((ref) => EnvImpl());

///
/// Data Dependencies
///
final dioProvider = Provider((ref) {
  var env = ref.watch(envProvider);
  var options = BaseOptions(
    baseUrl: env.apiBaseUrl,
  );

  var dio = Dio(options);
  if (F.appFlavor == Flavor.local) {
    dio.interceptors.add(DioInterceptor());
  }

  return dio;
});

///
/// Providers initialization for boostrap file
///
Future<void> initializeProviders(ProviderContainer container) async {
  /// Env
  await dotenv.load(fileName: F.envFileName);
  container.read(envProvider); // read to initialize

  /// Dio Setup
  container.read(dioProvider);
}
