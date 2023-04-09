import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/layout/cubit/cubit.dart';
import 'package:planetapp/modules/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanetCubit()..fillMap(),
      child: MaterialApp(
        title: 'Planet App',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.white),
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}
