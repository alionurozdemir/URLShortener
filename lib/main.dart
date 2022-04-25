import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_url_shortener/screen/home_view.dart';
import 'package:flutter_url_shortener/screen/into/intro_page_home.dart';
import 'package:flutter_url_shortener/screen/splash_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/intro': (context) => const IntroPageHome(),
        '/home': (context) => const Home(),
      },
    );
  }
}
