import 'package:flutter/material.dart';
import 'package:news_app/mu_theme_data.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/news_items/news_item-details.dart';
import 'package:news_app/ui/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.ligthTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName : (_)=>HomeScreen(),
        SplashScreen.routeName :(_)=>SplashScreen(),
        NewsItemDetails.routeName : (_)=> NewsItemDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}