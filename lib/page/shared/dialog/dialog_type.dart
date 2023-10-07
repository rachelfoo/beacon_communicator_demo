import 'package:beacon_communicator/page/shared/dialog/dialog.dart';
import 'package:beacon_communicator/page/shared/dialog/ui_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType {
  loading,
  warning,
  confirm,
}

class TextEditingControllerData {
  final String? initialValue;
  final String? hint;
  final int maxLines;

  TextEditingControllerData({this.initialValue, this.hint, this.maxLines = 1});
}

extension DialogTypeExtension on DialogType {
  Widget toWidget({
    required DialogRequest request,
    required Function(DialogResponse) completer,
  }) {
    switch (this) {
      case DialogType.loading:
        return const LoadingDialog();
      case DialogType.confirm:
        return ConfirmationDialog(
            dialog: _toBoolDialog(request: request, completer: completer));
      case DialogType.warning:
        return WarningDialog(
            dialog: _toBoolDialog(request: request, completer: completer));
    }
  }

  UIBoolDialog _toBoolDialog(
      {required DialogRequest request,
      required Function(DialogResponse) completer}) {
    return UIBoolDialog(
        description: request.description,
        title: request.title!,
        mainButtonTitle: request.mainButtonTitle,
        cancelButtonTitle: request.secondaryButtonTitle,
        callback: ({bool? value}) {
          completer(DialogResponse(data: value, confirmed: value ?? false));
        });
  }
}
