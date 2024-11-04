import 'package:clean_arc_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arc_bookly/Features/home/data/data_sources/home_remote_data_resource.dart';
import 'package:clean_arc_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arc_bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLoactor() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource:
          HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
      homeLocalDataSource: HomeDatalocalSourceImp()));
  // getIt.registerSingleton<SearchRepoImpl>(
  //     SearchRepoImpl(getIt.get<ApiService>()));
}