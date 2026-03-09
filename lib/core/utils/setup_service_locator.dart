import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class SetupServiceLocator {
  void setupServiceLocator() {
    getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
    getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(),
    );
    getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
    );
    getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(
        homeLocalDataSource: getIt<HomeLocalDataSource>(),
        homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      ),
    );
    getIt.registerLazySingleton<FetchFeaturedBooksUseCase>(
      () => FetchFeaturedBooksUseCase(homeRepo: getIt<HomeRepoImpl>()),
    );
    getIt.registerLazySingleton<FetchNewestBooksUseCase>(
      () => FetchNewestBooksUseCase(homeRepo: getIt<HomeRepoImpl>()),
    );
  }
}
