import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:petfinder_app/Features/Home/data/apis/cat_services.dart';
import 'package:petfinder_app/Features/Home/data/repo/cat_repository.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => CatService(sl()));
  sl.registerLazySingleton(() => CatRepository(sl()));
}
