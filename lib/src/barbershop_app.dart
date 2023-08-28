import 'package:barber_shop/src/features/splash/splash.dart';
import 'package:flutter/material.dart';

class BarberShopApp extends StatefulWidget {
  const BarberShopApp({super.key});

  @override
  State<BarberShopApp> createState() => _BarberShopAppState();
}

class _BarberShopAppState extends State<BarberShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DW Barber Shop',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
