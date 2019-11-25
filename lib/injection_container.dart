import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'features/lead/data/datasources/lead_remote_datasource.dart';
import 'features/lead/data/repositories/lead_repository_impl.dart';
import 'features/lead/domain/repositories/lead_repository.dart';
import 'features/lead/domain/usecases/get_leads.dart';
import 'features/lead/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Leads
  // Bloc
  sl.registerFactory(
    () => LeadBloc(leadRepositoryImpl: sl()),
  );
  sl.registerLazySingleton(() => GetLeads(sl()));

  // Repository
  sl.registerLazySingleton<LeadRepository>(
    () => LeadRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LeadRemoteDataSource>(
    () => LeadFirestoreDatasource(firestore: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<Firestore>(() => Firestore.instance);
  // sl.registerLazySingleton<FirebaseApp>(() => Firebase)
}
