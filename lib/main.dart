import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/Presentation/bloc/nav_bloc.dart';
import 'package:networking/Presentation/screens/main_page.dart';
import 'package:networking/Presentation/screens/splash_screen.dart';

void main() {
  runApp(BlocProvider(create: (_) => NavBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
//1- checking navigation + passed arguments
//2- checking bloc files + provider + builder
//3- going over the models and comparing the approaches for the toJson and fromJson AND the MOVIES class construction.
