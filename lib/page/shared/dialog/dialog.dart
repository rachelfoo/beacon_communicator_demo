import 'package:beacon_communicator/page/shared/dialog/ui_dialog.dart';
import 'package:beacon_communicator/utils/utils.dart';
import 'package:beacon_communicator/widget/button/long_button.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: BeaconColor.lightestGrey,
        content: Row(
          children: [
            const CircularProgressIndicator(),
            SizeConfig.mediumSmallLength.horizontalBox,
            Text(
              'Please wait...',
              style: BeaconTextStyles.mediumSmall(
                  color: BeaconColor.themeRed, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key, required this.dialog}) : super(key: key);

  final UIBoolDialog dialog;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: BeaconColor.white,
      title: Text(dialog.title ?? '',
          style: BeaconTextStyles.normal(fontWeight: FontWeight.bold)),
      content: dialog.description?.isNotEmpty == true
          ? Text(dialog.description!, style: BeaconTextStyles.normal())
          : null,
      contentPadding: dialog.description?.isNotEmpty == true
          ? EdgeInsets.symmetric(
              horizontal: SizeConfig.mediumLength,
              vertical: SizeConfig.standardLength)
          : null,
      actions: <Widget>[
        Padding(
          padding: SizeConfig.smallLength.padding,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: LongButton(
                      color: BeaconColor.white,
                      borderColor: BeaconColor.lighterGrey,
                      text: dialog.secondaryButtonTitle ?? 'Cancel',
                      textStyle: BeaconTextStyles.normal(
                        color: BeaconColor.themeRed,
                        fontWeight: FontWeight.w600,
                      ),
                      onPressed: () {
                        dialog.callback!(value: false);
                      })),
              SizeConfig.smallLength.horizontalBox,
              Expanded(
                child: LongButton(
                  onPressed: () {
                    dialog.callback!(value: true);
                  },
                  text: 'Confirm',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WarningDialog extends StatelessWidget {
  const WarningDialog({Key? key, required this.dialog}) : super(key: key);

  final UIBoolDialog dialog;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: BeaconColor.white,
      title: Text(dialog.title ?? '',
          style: BeaconTextStyles.normal(fontWeight: FontWeight.bold)),
      content: Text(dialog.description ?? '', style: BeaconTextStyles.normal()),
      actions: <Widget>[
        Padding(
          padding: SizeConfig.smallLength.padding,
          child: Row(
            children: <Widget>[
              Expanded(
                child: LongButton(
                    color: BeaconColor.white,
                    borderColor: BeaconColor.lighterGrey,
                    textStyle: BeaconTextStyles.normal(
                      color: BeaconColor.themeRed,
                      fontWeight: FontWeight.w600,
                    ),
                    text: dialog.mainButtonTitle ?? 'Confirm',
                    onPressed: () {
                      dialog.callback!(value: true);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
