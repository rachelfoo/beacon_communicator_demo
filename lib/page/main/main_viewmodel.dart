import 'dart:async';
import 'dart:io';

import 'package:beacon_communicator/app/app.locator.dart';
import 'package:beacon_communicator/service/permission/permission_status_page_service.dart';
import 'package:beacons_plugin/beacons_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  final PermissionStatusPageService _permissionStatusPageService =
      locator<PermissionStatusPageService>();
  final StreamController<String> beaconEventsController =
      StreamController<String>.broadcast();
  final List<String> beaconsData = [];

  void init() async {
    setBusy(true);
    // request location,bluetooth service
    await _permissionStatusPageService.request(
        permission: Permission.location, label: 'Location');
    await _permissionStatusPageService.request(
        permission: Permission.bluetooth, label: 'Bluetooth');
    await _permissionStatusPageService.request(
        permission: Permission.bluetoothConnect, label: 'Bluetooth');
    await _permissionStatusPageService.request(
        permission: Permission.bluetoothScan, label: 'Bluetooth Scan');

    //Send 'true' to run in background [OPTIONAL]
    await BeaconsPlugin.runInBackground(true);

    //IMPORTANT: Start monitoring once scanner is setup & ready (only for Android)
    if (Platform.isAndroid) {
      BeaconsPlugin.channel.setMethodCallHandler((call) async {
        if (call.method == 'scannerReady') {
          await BeaconsPlugin.startMonitoring();
          print('started monitoring');
        }
      });
    } else if (Platform.isIOS) {
      await BeaconsPlugin.startMonitoring();
      detectBeacon();
    }
    setBusy(false);
  }

  void detectBeacon() {
    beaconEventsController.stream.listen(
        (data) {
          if (data.isNotEmpty) {
            beaconsData.add(data);
            print("###" + data);
          }
        },
        onDone: () {},
        onError: (error) {
          print("Error: $error");
        });
  }
}
