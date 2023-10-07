import 'package:beacon_communicator/app/app.locator.dart';
import 'package:beacon_communicator/service/permission/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PermissionStatusViewModel extends BaseViewModel {
  PermissionStatus status;
  Permission permission;
  String label;
  bool fullAccessIsNeeded;

  final NavigationService _navigationService = locator<NavigationService>();
  final PermissionsService _permissionsService = locator<PermissionsService>();

  PermissionStatusViewModel(
      {required this.fullAccessIsNeeded,
      required this.status,
      required this.permission,
      required this.label});

  void requestPermission() async {
    if (status.isDenied) {
      status = await _permissionsService.request(permission: permission);

      notifyListeners();
      backIfAllowed();
    } else if (status.isPermanentlyDenied) {
      await _permissionsService.goToAppSettings();
    }
  }

  Future<void> checkStatus() async {
    status = await _permissionsService.check(permission: permission);
    notifyListeners();
    backIfAllowed();
  }

  void back() async {
    _navigationService.back(result: status);
  }

  void backIfAllowed() async {
    if (status.isAllowed(fullAccessIsNeeded: fullAccessIsNeeded)) {
      back();
    }
  }
}
