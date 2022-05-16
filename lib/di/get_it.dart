import 'package:get_it/get_it.dart';
import 'package:yebox_interview/data/services/dialog.dart';
import '../data/services/api/api_service.dart';
import '../data/services/navigation.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<NavigationServiceImpl>(() => NavigationServiceImpl());
  getItInstance.registerLazySingleton<DialogServicesImpl>(() => DialogServicesImpl());
  getItInstance.registerLazySingleton<ApiServiceImpl>(() => ApiServiceImpl());
}
