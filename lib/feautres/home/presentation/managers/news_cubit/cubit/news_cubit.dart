import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feautres/home/data/models/news_model.dart';
import 'package:news_app/feautres/home/presentation/views/bussines/buissens_view.dart';
import 'package:news_app/feautres/home/presentation/views/entertianment/entertain_view.dart';
import 'package:news_app/feautres/home/presentation/views/sports/sports_view.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {




  final Dio dio=Dio();
  static NewsModel newsModel= const NewsModel();
  final String apiKey = 'pub_532818c97feecfb722c33960bfa62b71be2c2';

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
 void changeIndexBottomBar(int index ) {
  currentIndex=index;
  if(index==0){
    fetchBusinessNews();
  }else if(index==1){
    fetchSportsNews();
  }else if(index==2){
    fetchEntertainmentNews();
  }

 emit(NewsChangeIndexState());
 }



// Api
List<dynamic> business=[];

// void getBusiness(){
// emit(NewsLoadingState());
// DioHelper.getData(
//   url:'https://newsdata.io/api/1/latest' ,
//    query: {
//       'country': 'kr',
//       'category': 'business',
//       'apikey': apiKey,
//    }).then((value) {
//    // print(value.data['totalResults']);
//     business=value.data['results'];
//     print(business.length);
//     emit(NewsSuccessBusinessState());

//    }).catchError((error){
//     print(error.toString());
//     emit(NewsFailureBussinessState(error.toString()));

//    });
// }

Future <void> fetchBusinessNews() async{
emit(NewsLoadingBusinessState());
  try {
  final response= await dio.get(
    'https://newsdata.io/api/1/latest',
    queryParameters: {
      'country': 'eg',
      'category': 'business',
      'apikey': apiKey,
    }
  );
   final data = NewsResponse.fromJson(response.data);
  emit(NewsSuccessBusinessState(data.articles));
} on Exception catch (e) {
  emit(NewsFailureBussinessState(e.toString()));
}
}
Future <void> fetchSportsNews() async{
emit(NewsLoadingSportsState());
  try {
  final response= await dio.get(
    'https://newsdata.io/api/1/latest',
    queryParameters: {
      'country': 'eg',
      'category': 'sports',
      'apikey': apiKey,
    }
  );
  final data = NewsResponse.fromJson(response.data);
  emit(NewsSuccessSportsState(data.articles));
} on Exception catch (e) {
  emit(NewsFailureSportsState(e.toString()));
}
}


Future <void> fetchEntertainmentNews() async{
emit(NewsLoadingEntertainState());
  try {
  final response= await dio.get(
    'https://newsdata.io/api/1/latest',
    queryParameters: {
      'country': 'eg',
      'category': 'entertainment',
      'apikey': apiKey,
    }
  );
  final data = NewsResponse.fromJson(response.data);
  emit(NewsSuccessEntertainState(data.articles));
} on Exception catch (e) {
  emit(NewsFailureEntertainState(e.toString()));
}
}
bool isdark=false;
void changeAppMode(){
  isdark=!isdark;
  emit(NewsAppModeState());
}

}
