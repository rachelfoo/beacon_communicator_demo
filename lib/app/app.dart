import 'package:beacon_communicator/page/main/main_view.dart';
import 'package:beacon_communicator/page/shared/permission/permission_status_view.dart';
import 'package:beacon_communicator/service/permission/permission_service.dart';
import 'package:beacon_communicator/service/permission/permission_status_page_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: MainView, initial: true),
  MaterialRoute(page: PermissionStatusView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: PermissionsService),
  LazySingleton(classType: PermissionStatusPageService),
], logger: StackedLogger())
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
