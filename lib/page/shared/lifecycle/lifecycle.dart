import 'package:flutter/material.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget? child;
  final Future<void> Function() onResumed;

  const LifeCycleManager({Key? key, this.child, required this.onResumed})
      : super(key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  AppLifecycleState? previousState;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (previousState == AppLifecycleState.paused &&
        (state == AppLifecycleState.resumed ||
            state == AppLifecycleState.inactive)) {
      widget.onResumed();
    }
    previousState = state;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
