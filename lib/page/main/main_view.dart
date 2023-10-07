import 'package:beacon_communicator/page/main/main_viewmodel.dart';
import 'package:beacon_communicator/utils/colors.dart';
import 'package:beacon_communicator/utils/size_config.dart';
import 'package:beacon_communicator/utils/text_style.dart';
import 'package:beacon_communicator/widget/button/long_button.dart';
import 'package:beacon_communicator/widget/layout/page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => MainViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, item) => BeaconPage(
            isAllBusy: model.isBusy,
            bottomSheet: _bottomSheet(model),
            body: Column(
              children: [
                Text(
                  'Beacon Communicator',
                  style: BeaconTextStyles.medium(
                      fontWeight: FontWeight.bold,
                      color: BeaconColor.facebookBlue),
                ),
              ],
            )));
  }

  Widget _bottomSheet(MainViewModel model) {
    return Container(
        color: BeaconColor.white,
        padding: SizeConfig.standardPadding,
        child: LongButton(
          onPressed: model.detectBeacon,
          text: 'Redetect Beacon',
        ));
  }
}
