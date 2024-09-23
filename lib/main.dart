import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/helper/dio_helper.dart';
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
    return  MaterialApp(
      home:const NewsView(),
     debugShowCheckedModeBanner: false,
     darkTheme: ThemeData(

      scaffoldBackgroundColor: Colors.black12,
      floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange,
      )
     ),
     
     themeMode: ThemeMode.light,
     
     theme: ThemeData
     (
       floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange,
      ),
      primarySwatch:Colors.deepOrange ,
      scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      elevation: 20,


    ),
      appBarTheme:const AppBarTheme(
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
}
}
