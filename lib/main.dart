import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/app_cubitlogics.dart';
import 'package:tourism/cubit/app_cubits.dart';
import 'package:tourism/pages/detailpages/cubit/store_pageinfo_cubit.dart';
import 'package:tourism/pages/detailpages/detail_page.dart';
import 'package:tourism/pages/navpages/main_page.dart';
import 'package:tourism/services/data_services.dart';

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
      home: MultiBlocProvider(
        providers: [
           BlocProvider<AppCubits>
      (
        create:(context)=>AppCubits(
          data: DataServices(),
        ),
      ),

        BlocProvider<StorePageInfoCubits>
      (
        create:(context)=>StorePageInfoCubits(),
      ),
        ],
         child:const AppCubitLogics(),
          ),
    );
  }
}
