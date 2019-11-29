import 'package:get_it/get_it.dart';

import 'features/lead/data/repositories/firebase_lead_repository.dart';
import 'features/lead/domain/repositories/lead_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Leads
  sl.registerLazySingleton<LeadRepository>(() => FirebaseLeadRepository());
}
