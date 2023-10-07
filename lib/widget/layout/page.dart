import 'package:beacon_communicator/widget/layout/scroll_view/center_scroll_view.dart';
import 'package:beacon_communicator/widget/layout/scroll_view/scroll_view.dart';
import 'package:beacon_communicator/widget/other/progress_loader.dart';
import 'package:flutter/material.dart';

class BeaconPage extends StatelessWidget {
  const BeaconPage(
      {Key? key,
      this.bottomSheet,
      this.backgroundColor,
      this.isCenter = false,
      this.isAllBusy = false,
      this.isBusy = false,
      this.isSafeArea = true,
      this.padding,
      this.extendBody = false,
      this.appBar,
      this.physics = const AlwaysScrollableScrollPhysics(),
      this.floatingActionButton,
      this.showScrollbar = false,
      this.bottomNavigationBar,
      required this.body})
      : super(key: key);

  final bool isCenter;
  final AppBar? appBar;
  final bool isSafeArea;
  final Widget body;
  final EdgeInsets? padding;
  final bool isBusy;
  final bool extendBody;
  final ScrollPhysics physics;
  final bool showScrollbar;
  final bool isAllBusy;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final BottomNavigationBar? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBody,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: isSafeArea ? SafeArea(child: _getBody(context)) : _getBody(context),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet == null ? null : SafeArea(child: bottomSheet!),
    );
  }

  Widget _getBody(BuildContext context) {
    if (isAllBusy) {
      return ProgressLoader(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      );
    }
    return Stack(children: [
      isCenter
          ? BeaconCenterScrollView(
              physics: physics, padding: padding, child: body)
          : BeaconScrollView(
              physics: physics,
              showScrollbar: showScrollbar,
              padding: padding,
              child: body),
      if (isBusy) const ProgressLoader(),
    ]);
  }
}
