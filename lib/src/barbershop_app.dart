import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barber_shop/src/core/ui/theme/theme.dart';
import 'package:barber_shop/src/features/features.dart';
import 'package:flutter/material.dart';

import './core/ui/widgets/widgets.dart';

class BarberShopApp extends StatefulWidget {
  const BarberShopApp({super.key});

  @override
  State<BarberShopApp> createState() => _BarberShopAppState();
}

class _BarberShopAppState extends State<BarberShopApp> {
  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarberShopLoader(),
      enableLog: true,
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'DW Barber Shop',
          debugShowCheckedModeBanner: false,
          theme: BarberShopTheme.themeData,
          routes: {
            '/': (context) => const SplashPage(),
            'auth/login': (context) => const LoginPage(),
          },
          navigatorObservers: [asyncNavigatorObserver],
        );
      },
    );
  }
}
