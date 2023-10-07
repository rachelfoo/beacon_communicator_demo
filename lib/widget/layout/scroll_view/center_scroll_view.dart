import 'package:beacon_communicator/utils/size_config.dart';
import 'package:flutter/material.dart';

class BeaconCenterScrollView extends StatelessWidget {
  const BeaconCenterScrollView(
      {Key? key, this.physics, required this.child, this.padding})
      : super(key: key);

  final Widget child;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: physics,
        padding: padding ?? SizeConfig.standardPadding,
        child: child,
      ),
    );
  }
}
