import 'package:flutter/material.dart';
import 'package:flutter_emanuel/screens/screens.dart';
import 'package:flutter_emanuel/themes/default_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme.base,
      initialRoute: OptionsScreen.routerName,
      routes: {
        HomeScreen.routerName: (context) => const HomeScreen(),
        OptionsScreen.routerName: (context) => OptionsScreen(),
      },
    );
  }
}
