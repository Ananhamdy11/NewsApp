import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feautres/home/presentation/views/bussines/buissens_view.dart';
import 'package:news_app/feautres/home/presentation/views/entertianment/entertain_view.dart';
import 'package:news_app/feautres/home/presentation/views/sports/sports_view.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

int currentIndex=0;
 List<BottomNavigationBarItem> bottomItems= const[
  BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
  BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
  BottomNavigationBarItem(icon: Icon(Icons.movie_creation),label: 'Entertainment'),

 ];

List <Widget> screens=[
const BussinessView(),
const SportsView(),
const EntertainView(),
];
 void changeIndexBottomBar(int index){
  currentIndex=index;
 emit(NewsChangeIndexState());
 }

}
