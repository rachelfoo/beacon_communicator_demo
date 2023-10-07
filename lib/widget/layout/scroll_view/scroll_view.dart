import 'package:beacon_communicator/utils/size_config.dart';
import 'package:flutter/material.dart';

class BeaconScrollView extends StatelessWidget {
  const BeaconScrollView(
      {Key? key,
      this.physics,
      this.showScrollbar = false,
      required this.child,
      this.padding})
      : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final bool showScrollbar;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return showScrollbar
        ? Scrollbar(
            thickness: 10,
            child: SingleChildScrollView(
              physics: physics,
              padding: padding ?? SizeConfig.mediumSmallLength.padding,
              child: child,
            ),
          )
        : SingleChildScrollView(
            physics: physics,
            padding: padding ?? SizeConfig.mediumSmallLength.padding,
            child: child,
          );
  }
}
