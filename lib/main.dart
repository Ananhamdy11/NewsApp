import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/feautres/home/presentation/views/news_view.dart';

void main() {
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
     theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed
    ),
      appBarTheme:const AppBarTheme(
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
