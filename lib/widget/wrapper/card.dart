import 'package:beacon_communicator/utils/constants.dart';
import 'package:beacon_communicator/utils/size_config.dart';
import 'package:flutter/material.dart';

class BeaconCard extends StatelessWidget {
  const BeaconCard(
      {Key? key,
      this.shadowColor,
      this.shape,
      required this.child,
      this.clip = Clip.none,
      this.padding,
      this.elevation,
      this.height,
      this.width,
      this.radius,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.color})
      : super(key: key);

  final Widget child;
  final double? elevation;
  final double? radius;
  final Color? color;
  final Clip clip;
  final ShapeBorder? shape;
  final BorderRadius? borderRadius;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      clipBehavior: clip,
      shadowColor: shadowColor ?? color,
      elevation: elevation ?? BeaconConstants.elevation,
      shape: shape ??
          RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? BeaconConstants.borderThickness),
            borderRadius: BorderRadius.circular(
                radius ?? BeaconConstants.containerRadius),
          ),
      child: Container(
        width: width,
        height: height,
        padding: padding ??
            EdgeInsets.symmetric(
                vertical: SizeConfig.mediumSmallerLength,
                horizontal: SizeConfig.mediumSmallLength),
        child: child,
      ),
    );
  }
}
