import 'package:dio/dio.dart';
class DioHelper{
  



static Dio? dio;
 static init(){
 dio=Dio(
 BaseOptions(
  baseUrl: 'https://newsdata.io/api/1/latest',
  receiveDataWhenStatusError: true,
 )
 );
}


static Future getData({required String url,required Map<String,dynamic> query})async{
  
 return await dio!.get(url,queryParameters:query );

}



}