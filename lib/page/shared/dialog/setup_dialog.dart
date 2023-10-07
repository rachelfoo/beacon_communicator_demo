import 'package:beacon_communicator/app/app.locator.dart';
import 'package:beacon_communicator/page/shared/dialog/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    for (var e in DialogType.values)
      e: (context, sheetRequest, completer) =>
          e.toWidget(request: sheetRequest, completer: completer)
  };

  dialogService.registerCustomDialogBuilders(builders);
}
