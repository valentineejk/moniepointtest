import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_page.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
    title: 'Moniepoint Valentine Test',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
      useMaterial3: true,
    ),
    home: MainPage(),
  ));
}
