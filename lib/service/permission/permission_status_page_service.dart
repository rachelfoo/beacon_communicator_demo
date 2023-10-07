import 'package:beacon_communicator/app/app.locator.dart';
import 'package:beacon_communicator/app/app.router.dart';
import 'package:beacon_communicator/service/permission/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';

class PermissionStatusPageService {
  final NavigationService _navigationService = locator<NavigationService>();
  final PermissionsService _permissionsService = locator<PermissionsService>();

  Future<bool> request(
      {required Permission permission,
      required String label,
      bool isDark = true,
      bool fullAccessIsNeeded = false}) async {
    PermissionStatus status =
        await _permissionsService.request(permission: permission);

    // if is not allowed
    if (!status.isAllowed(fullAccessIsNeeded: fullAccessIsNeeded)) {
      final newStatus = await _navigationService.navigateTo(
          Routes.permissionStatusView,
          arguments: PermissionStatusViewArguments(
              status: status,
              permission: permission,
              label: label,
              isDark: isDark,
              fullAccessIsNeeded: fullAccessIsNeeded));
      if (newStatus != null) {
        status = newStatus;
      }
    }

    return status.isAllowed(fullAccessIsNeeded: fullAccessIsNeeded);
  }
}
