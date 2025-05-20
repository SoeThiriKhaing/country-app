
import 'package:country/features/domain/usecases/load_alll_countries_usecase.dart';
import 'package:country/presentation/bloc/country_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/data/data_sources/country_remote_datasource.dart';
import 'features/data/data_sources/country_remote_datasource_impl.dart';
import 'features/data/repositories/country_repo_impl.dart';
import 'features/domain/repositories/country_repo.dart';
import 'features/domain/usecases/country_usecase.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => CountryBloc(searchCountry: sl(), loadAllCountries: sl()));

  // Usecases
  sl.registerLazySingleton(() => SearchCountry(sl()));
  sl.registerLazySingleton(()=>LoadAlllCountriesUsecase(sl()));

  // Repository
  sl.registerLazySingleton<CountryRepository>(
          () => CountryRepositoryImpl(remoteDataSource: sl()));

  // Data source
  sl.registerLazySingleton<CountryRemoteDataSource>(
          () => CountryRemoteDataSourceImpl(client: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
