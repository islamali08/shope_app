import 'package:dio/dio.dart';

class diohelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,


    )
    );
  }

  static Future<Response> postdata({
    String? url,
    Map<String, dynamic>? qure,
    Map<String, dynamic>? data,
    String lang= 'ar',
    String? outh


  }) async{
  dio!.options.headers={
    'Content-Type':'application/json',

    'lang':lang,
    'Authorization':outh
  };
    return await dio!.post(url!, queryParameters: qure, data: data);
  }


  static Future<Response> getdata (
  {
  required String url ,
    Map<String,dynamic>? qury ,
    String lang ='en' ,
    String? token ,



}
      )async{
    dio!.options.headers={
      'Content-Type':'application/json',

      'lang':lang,
      'Authorization':token
    };


  return  await dio!.get(
        url,
      queryParameters: qury


    );
  }

}
