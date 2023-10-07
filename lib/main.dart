import 'package:beacon_communicator/app/app.locator.dart';
import 'package:beacon_communicator/page/main/main_view.dart';
import 'package:beacon_communicator/page/shared/dialog/setup_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// setup stacked
  setupLocator();
  setupDialogUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}
