import 'package:flutter/material.dart';
import 'package:flutter_app_demo/blocs/location_bloc.dart';
import 'package:flutter_app_demo/blocs/location_event.dart';
import 'package:flutter_app_demo/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> LocationBloc()..add(FetchLocations()),
    child: MaterialApp(
      title: 'TCS Locator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    ),);
  }
}
