import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const ProviderScope(
    child:  MyApp()
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor:const Color.fromARGB(255, 202, 9, 183)),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
   debugShowCheckedModeBanner: false,
   
      home: const TapsScreen(),
    );
  }
}



