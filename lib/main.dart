import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/app_cubitlogics.dart';
import 'package:tourism/cubit/app_cubits.dart';
import 'package:tourism/pages/detail_page.dart';
import 'package:tourism/pages/navpages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider<AppCubits>
      (
        create:(context)=>AppCubits(),
        child: AppCubitLogics(),
      )
    );
  }
}
