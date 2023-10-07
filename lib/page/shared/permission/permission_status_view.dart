import 'package:beacon_communicator/page/shared/lifecycle/lifecycle.dart';
import 'package:beacon_communicator/page/shared/permission/permission_status_viewmodel.dart';
import 'package:beacon_communicator/service/permission/permission_service.dart';
import 'package:beacon_communicator/utils/utils.dart';
import 'package:beacon_communicator/widget/button/long_button.dart';
import 'package:beacon_communicator/widget/layout/scroll_view/center_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

class PermissionStatusView extends StatelessWidget {
  const PermissionStatusView(
      {Key? key,
      this.isDark,
      this.fullAccessIsNeeded = false,
      required this.status,
      required this.permission,
      required this.label})
      : super(key: key);

  final PermissionStatus status;
  final Permission permission;
  final String label;
  final bool? isDark;
  final bool fullAccessIsNeeded;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PermissionStatusViewModel>.reactive(
        viewModelBuilder: () => PermissionStatusViewModel(
            status: status,
            permission: permission,
            label: label,
            fullAccessIsNeeded: fullAccessIsNeeded),
        builder: (context, model, item) => LifeCycleManager(
              onResumed: model.checkStatus,
              child: Scaffold(
                  backgroundColor: BeaconColor.black,
                  extendBody: true,
                  body: BeaconCenterScrollView(
                      child: Column(
                    children: [
                      Icon(
                        Icons.error_outlined,
                        color: BeaconColor.themeRed,
                        size: SizeConfig.height * 0.15,
                      ),
                      SizeConfig.verticalBox,
                      Text(
                        'Allow access to $label',
                        style: BeaconTextStyles.medium(
                            color: isDark == true
                                ? BeaconColor.themeRed
                                : BeaconColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizeConfig.smallLength.verticalBox,
                      Text(
                        '${status.description(label)}',
                        textAlign: TextAlign.center,
                        style: BeaconTextStyles.normal(
                            color: isDark == true
                                ? Colors.white
                                : BeaconColor.black),
                      ),
                      SizeConfig.mediumSmallLength.verticalBox,
                      LongButton(
                          text: status.buttonText,
                          onPressed: model.requestPermission)
                    ],
                  ))),
            ));
  }
}
