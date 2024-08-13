import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app2/changenotifyer.dart';
import 'package:shopping_app2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> cartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),  // give the primary colour of yellow
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
            ),
            prefixIconColor: Color.fromRGBO(100, 100, 100, 1)
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleSmall: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(100, 100, 100, 1)
            ),
            titleMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            )
          )
        ),
        home: const HomePage(),
      ),
    );
  }
}
