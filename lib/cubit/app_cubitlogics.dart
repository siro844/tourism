import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/app_cubits.dart';
import 'package:tourism/cubit/app_cubitstates.dart';
import 'package:tourism/pages/detailpages/detail_page.dart';
import 'package:tourism/pages/homepage.dart';
import 'package:tourism/pages/navpages/main_page.dart';
import 'package:tourism/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
           if(state is WelcomeState){
            return const WelcomePage();
           }
            if(state is LoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );

           }
           if(state is LoadedState){
            return const MainPage();
           }
           if(state is DetailState){
            return const DetailPage();
           }

           else{
            return Container();
           }
        }
        ),
    );
  }
}