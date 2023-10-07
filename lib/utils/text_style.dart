import 'package:beacon_communicator/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeaconTextStyles {
  /// mini text style
  static TextStyle mini(
          {Color? color, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: SizeConfig.miniLength,
          fontFamily: 'Manrope');

  /// small text style
  static TextStyle small(
          {Color? color, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: SizeConfig.smallLength,
          fontFamily: 'Manrope');

  /// normal text style
  static TextStyle normal(
          {Color? color, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: SizeConfig.standardLength,
          fontFamily: 'Manrope');

  /// medium small text style
  static TextStyle mediumSmall(
          {TextDecoration? decoration,
          Color? color,
          FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: fontWeight,
          decoration: decoration,
          color: color,
          fontSize: SizeConfig.mediumSmallerLength,
          fontFamily: 'Manrope');

  /// medium text style
  static TextStyle medium(
          {Color? color, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: SizeConfig.mediumLength,
          fontFamily: 'Manrope');

  /// large text style
  static TextStyle large(
          {Color? color, FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: SizeConfig.largeLength,
          fontFamily: 'Manrope');
}
