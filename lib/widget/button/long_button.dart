import 'package:beacon_communicator/utils/colors.dart';
import 'package:beacon_communicator/utils/constants.dart';
import 'package:beacon_communicator/utils/size_config.dart';
import 'package:beacon_communicator/utils/text_style.dart';
import 'package:beacon_communicator/widget/wrapper/card.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton(
      {Key? key,
      this.isExpanded = true,
      this.color = BeaconColor.facebookBlue,
      this.text,
      this.borderColor,
      this.child,
      this.textStyle,
      this.padding,
      required this.onPressed})
      : super(key: key);
  final String? text;
  final Widget? child;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsets? padding;
  final Color? borderColor;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: BeaconCard(
          padding: padding ?? SizeConfig.smallLength.padding,
          radius: BeaconConstants.radius,
          width: isExpanded ? SizeConfig.width : null,
          elevation: 0.0,
          borderColor: borderColor,
          color: color,
          child: child ??
              Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: textStyle ??
                    BeaconTextStyles.normal(
                        color: Colors.white, fontWeight: FontWeight.bold),
              )),
    );
  }
}
