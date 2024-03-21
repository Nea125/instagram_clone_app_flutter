import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../models/user_res_model.dart';
class NetworkService{
  final Dio dio = Dio(
    BaseOptions(
      // php artisan serve --host 10.1.9.245 --port 8000
      baseUrl: "http://10.1.9.245:8000/api",
      followRedirects: false, 
      // responseType: ResponseType.json,
      // receiveTimeout: const Duration(seconds: 30),
      // connectTimeout: const Duration(seconds: 30),
      // receiveDataWhenStatusError: true,
       validateStatus: (status) {
        return status! <500;
      },
        headers: {  
        Headers.acceptHeader:"application/json",
        Headers.contentTypeHeader:"application/json"
      }
    )
  );
 Future<String> signup({required String email,required String name, required String password,required File? profileImage,
})
 async {
  try {
    final formData = FormData.fromMap({
      "email": email,
      "name": name,
      "password": password,
      "password_confirmation": password,
      "profile_image": await MultipartFile.fromFile(profileImage!.path),
    });
    final response = await dio.post(
      '/register',
      data: formData,
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw TimeoutException('The request timed out');
      },
    );

    if(response.statusCode == 200) {
      return "success";
    } else {
      return response.data["message"];
    }
  }catch(e)
  {
    throw Exception(e);
  }
}

Future<UserResModel> login ({required String email,required String password}) async{
    try{
          final response = await dio.post('/login',
          data: {
            'email':email,
            'password':password
          });
          if(response.statusCode==200)
          {
               return UserResModel.fromJson(response.data);
               
          }
          else{
               throw Exception(response.data['message']);
             
          }
        }catch(e){
          throw Exception(e);
        }
  }

  // logout
  Future<bool>logout({required String token}) async{
    try{

          final response =  await dio.post('/logout',
          options: Options(
            headers: {
              'Authorization':'Bearer $token'
            }
          )
          );
          if(response.statusCode==200)
          {
               return true;
          }
          else{

               throw Exception(response.data["message"]);
          }
        }catch(e){
          throw Exception(e);
        }
  }
 
}