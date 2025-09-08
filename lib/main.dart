import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/Presentation/bloc/nav_bloc.dart';
import 'package:networking/notes/boxfit_demo.dart';
import 'package:networking/Presentation/screens/main_page.dart';
import 'package:networking/Presentation/screens/splash_screen.dart';
import 'Presentation/screens/home_screen.dart';

void main() {
  runApp(BlocProvider(create: (_) => NavBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
    );
  }
}
