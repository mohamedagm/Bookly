import 'package:bookly/features/home/data/remote/api_service.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class SetupServiceLocator {
  void setupServiceLocator() {
    getIt.registerSingleton<ApiService>(ApiService(Dio()));
    getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(getIt.get<ApiService>()),
    );
  }
}
