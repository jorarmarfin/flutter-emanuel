import 'package:flutter/material.dart';
import 'package:flutter_emanuel/providers/providers.dart';
import 'package:flutter_emanuel/screens/screens.dart';
import 'package:flutter_emanuel/themes/default_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DrupalProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => UtilsProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => LocalProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => OctoberProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
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
        OptionsScreen.routerName: (context) => const OptionsScreen(),
        ConstruccionScreen.routerName: (context) => const ConstruccionScreen(),
        CumplesScreen.routerName: (context) => const CumplesScreen(),
        EmanuelInfoScreen.routerName: (context) => const EmanuelInfoScreen(),
        EmanuelHistoriaScreen.routerName: (context) =>
            const EmanuelHistoriaScreen(),
        RecursosScreen.routerName: (context) => const RecursosScreen(),
        MisasScreen.routerName: (context) => const MisasScreen(),
        SantisimoScreen.routerName: (context) => const SantisimoScreen(),
        OfrendasScreen.routerName: (context) => const OfrendasScreen(),
        AvisosScreen.routerName: (context) => const AvisosScreen(),
      },
    );
  }
}
