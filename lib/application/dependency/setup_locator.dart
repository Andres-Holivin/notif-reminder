import 'package:get_it/get_it.dart';
import 'package:idg/application/router/root_router.dart';
import 'package:idg/data/service/local_notification_service.dart';
import 'package:idg/data/service/timezone_service.dart';

final getIt = GetIt.I;
void setupLocator() {
  getIt.registerSingleton<TimezoneService>(TimezoneService());
  getIt<TimezoneService>().configureLocalTimeZone();
  getIt.registerSingleton<LocalNotificationService>(LocalNotificationService());
  getIt<LocalNotificationService>().initializeNotification();
  getIt.registerFactory(() => RootRouter());
}
