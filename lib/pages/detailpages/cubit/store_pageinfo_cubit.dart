import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/pages/detailpages/cubit/store_page_info.dart';

class StorePageInfoCubits extends Cubit <List<StorePageInfoState>>{
  StorePageInfoCubits():super([]);
  
  addPageInfo(String? name,int? index){
    emit([StorePageInfoState(index: index,name: name),...state]);
  }

  
}