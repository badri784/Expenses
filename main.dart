import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'widget/expenses.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

var mycolorscheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 96, 179),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      theme: ThemeData().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
        colorScheme: mycolorscheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: mycolorscheme.onPrimaryContainer,
          foregroundColor: mycolorscheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: mycolorscheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: mycolorscheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: mycolorscheme.onSecondaryContainer,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: mycolorscheme.primaryContainer,
        ),
      ),

      home: Expenses(),
    );
  }
}
