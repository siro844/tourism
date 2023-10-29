import 'package:bloc/bloc.dart';
import 'package:tourism/cubit/app_cubitstates.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits():super(InitialState()){
    emit(WelcomeState());
  }
  
}