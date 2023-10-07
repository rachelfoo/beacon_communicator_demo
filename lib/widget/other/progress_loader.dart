import 'package:beacon_communicator/utils/colors.dart';
import 'package:flutter/material.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: const SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: BeaconColor.themeRed,
          ),
        ),
      ),
    );
  }
}
