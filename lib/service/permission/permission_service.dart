import 'package:beacon_communicator/app/app.locator.dart';
import 'package:beacon_communicator/page/shared/dialog/dialog_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';

extension PermissionStatusExtension on PermissionStatus {
  String? description(String label) {
    switch (this) {
      case PermissionStatus.denied:
        return '$label permissions were denied by user. Allow them to continue';
      case PermissionStatus.permanentlyDenied:
        return '$label permissions are permanently denied, we cannot request permissions. Please go to app settings to allow $label permissions.';
      case PermissionStatus.restricted:
        return '$label permissions are restricted. Permissions cannot be granted to user';
      default:
        return null;
    }
  }

  String? get buttonText {
    switch (this) {
      case PermissionStatus.denied:
        return 'Allow';
      case PermissionStatus.permanentlyDenied:
        return 'App settings';
      case PermissionStatus.restricted:
        return 'Try later';
      default:
        return null;
    }
  }

  bool isAllowed({bool fullAccessIsNeeded = false}) {
    if (fullAccessIsNeeded) {
      return isGranted;
    }
    return isGranted || isLimited;
  }
}

class PermissionsService {
  /// dialog service
  final DialogService _dialogService = locator<DialogService>();

  /// check permission status
  Future<PermissionStatus> check({required Permission permission}) async {
    return await permission.status;
  }

  /// request permission if is denied
  Future<PermissionStatus> request({required Permission permission}) async {
    PermissionStatus status = await permission.request();
    return status;
  }

  /// open app settings if
  Future<bool> goToAppSettings() async {
    return await openAppSettings();
  }

  /// execute a permission request flow using Dialog
  Future<bool> runRequestFlow(
      {required Permission permission,
      required String label,
      bool fullAccessIsNeeded = false}) async {
    PermissionStatus status = await permission.request();
    if (status.isDenied) {
      await _showDialog(
          status: status,
          label: label,
          callback: () async {
            status = await request(permission: permission);
          });
    }
    if (status.isPermanentlyDenied) {
      await _showDialog(
          status: status,
          label: label,
          callback: () async {
            await openAppSettings();
          });
    }
    if (status.isRestricted) {
      await _showDialog(status: status, label: label);
    }

    return status.isAllowed(fullAccessIsNeeded: fullAccessIsNeeded);
  }

  /// execute a permission request flow using Dialog
  Future<bool> requestOnce(
      {required Permission permission,
      required String label,
      bool fullAccessIsNeeded = false}) async {
    PermissionStatus status = await request(permission: permission);
    if (status.isDenied) {
      status = await request(permission: permission);
    } else if (status.isPermanentlyDenied) {
      await _showDialog(
          status: status,
          label: label,
          callback: () async {
            await openAppSettings();
          });
    } else if (status.isRestricted) {
      await _showDialog(status: status, label: label);
    }

    return status.isAllowed(fullAccessIsNeeded: fullAccessIsNeeded);
  }

  Future<void> _showDialog({
    required PermissionStatus status,
    required String label,
    Future<void> Function()? callback,
  }) async {
    DialogResponse? dialogResponse = await _dialogService.showCustomDialog(
      variant: callback == null ? DialogType.warning : DialogType.confirm,
      title: 'Failed to get $label permission',
      mainButtonTitle: status.buttonText,
      description: status.description(label),
    );

    if (dialogResponse?.confirmed == true && callback != null) {
      await callback();
    }
  }
}
