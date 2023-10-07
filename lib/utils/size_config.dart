import 'package:beacon_communicator/utils/constants.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static late Size size;
  static late double width;
  static late double height;
  static late double standardLength;
  static late double miniLength;
  static late double smallLength;
  static late double mediumSmallerLength;
  static late double mediumSmallLength;
  static late double mediumLength;
  static late double mediumLargeLength;
  static late double largeLength;
  static late double maxiLength;

  void init(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    standardLength = width * BeaconConstants.paddingRatio;
    miniLength = standardLength / 2;
    smallLength = standardLength * 0.8;
    mediumSmallerLength = standardLength * 1.2;
    mediumSmallLength = standardLength * 3 / 2;
    mediumLength = standardLength * 1.63;
    mediumLargeLength = standardLength * 3;
    largeLength = standardLength * 4;
    maxiLength = standardLength * 5;
  }

  /// standard horizontal box
  static SizedBox get horizontalBox => SizedBox(
        width: standardLength,
      );

  /// standard vertical box
  static SizedBox get verticalBox => SizedBox(
        height: standardLength,
      );

  /// standard all padding
  static EdgeInsets get standardPadding => EdgeInsets.all(standardLength);
}

extension SizedBoxGenerator on double {
  SizedBox get verticalBox {
    return SizedBox(
      height: this,
    );
  }

  SizedBox get horizontalBox {
    return SizedBox(
      width: this,
    );
  }
}

extension PaddingGenerator on double {
  EdgeInsets get padding {
    return EdgeInsets.all(this);
  }

  EdgeInsets get verticalPadding {
    return EdgeInsets.symmetric(vertical: this);
  }

  EdgeInsets get horizontalPadding {
    return EdgeInsets.symmetric(horizontal: this);
  }

  EdgeInsets get leftPadding {
    return EdgeInsets.only(left: this);
  }

  EdgeInsets get rightPadding {
    return EdgeInsets.only(right: this);
  }

  EdgeInsets get topPadding {
    return EdgeInsets.only(top: this);
  }

  EdgeInsets get bottomPadding {
    return EdgeInsets.only(bottom: this);
  }
}

extension WidgetWrapper on Widget {
  Widget withPadding({EdgeInsets? padding}) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
              left: SizeConfig.standardLength,
              right: SizeConfig.standardLength,
              bottom: SizeConfig.standardLength),
      child: this,
    );
  }

  Widget withHorizontalPadding({double? length}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: length ?? SizeConfig.standardLength),
      child: this,
    );
  }

  Widget withSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  Widget withInkWell({required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: this,
    );
  }

  Widget withDivider({EdgeInsets? padding}) {
    return Column(
      children: [Container(padding: padding, child: this), const Divider()],
    );
  }
}
