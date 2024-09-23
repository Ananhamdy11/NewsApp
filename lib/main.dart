import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/core/helper/dio_helper.dart';
import 'package:news_app/feautres/home/presentation/managers/news_cubit/cubit/news_cubit.dart';
import 'package:news_app/feautres/home/presentation/views/news_view.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit(),
    
      child: BlocConsumer<NewsCubit,NewsState>(
        builder: ( context,  state) { 
          return MaterialApp(
          home:const NewsView(),
         debugShowCheckedModeBanner: false,
         darkTheme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:Colors.white
            )
          ),
          scaffoldBackgroundColor: HexColor('333739'),
          floatingActionButtonTheme:const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
                primarySwatch:Colors.deepOrange ,
        
         bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          backgroundColor: HexColor('333739'),
        ),
          appBarTheme: AppBarTheme(
            titleSpacing: 20,
            iconTheme:const IconThemeData(
              color: Colors.white
            ),
            titleTextStyle:const TextStyle(
              fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
        
            ),
            backgroundColor: HexColor('333739'),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarBrightness: Brightness.dark,
          ),
        
         )),
         
         
         themeMode: NewsCubit.get(context).isdark? ThemeMode.dark:ThemeMode.light,
         
         theme: ThemeData
         (
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:Colors.black
            )
          ),
           floatingActionButtonTheme:const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          primarySwatch:Colors.deepOrange ,
          scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(
           type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          elevation: 20,
          backgroundColor: Colors.white,
        ),
          appBarTheme:const AppBarTheme(
            titleSpacing: 20,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            titleTextStyle:TextStyle(
              fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
        
            ),
            backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
        
         )),
        
        
        );
   
         },
        listener: ( context,  state) {  },
      ),
    );
}
}
