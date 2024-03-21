
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone_app/routes/route_to_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../api/api.dart';
class AuthController extends GetxController{
  File? profileImage;
  final imagePicker = ImagePicker();
  final authService = NetworkService();
   void selectProfile() async
   {
      // ignore: non_constant_identifier_names
      final PickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if(PickedFile !=null)
      {
           profileImage = File(PickedFile.path);
           update();
      }
   }
   // set Image
 void setImage() async {
      final ByteData data = await rootBundle.load('assets/images/pro.png');
      List<int> bytes = data.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/pro.png');
      await file.writeAsBytes(bytes);
      profileImage = file;
      update();
}
  void signup({required String email,required String name,required String password,}) async
   {
    try{
          if(profileImage==null)
          {
            Get.snackbar('message', 'Profile Image not selected..');
            return;
          }
          final response = await authService.signup(
            email: email,
            name: name, 
            password: password, 
            profileImage: File(profileImage!.path),
         );
          QuickAlert.show(

              context: Get.context!,
              type: QuickAlertType.success,
              text: 'Register Successfull',

           );
    }
    catch(e)
    {
       throw Exception(e);
    }
   }

   void login({required String email,required String password})async
   {
    
     try{
         final response =  await authService.login(email: email, password: password);
         debugPrint('AccessToken :${response.accessToken}');
         NextScreen();
      }catch(e){
      QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: "$e",
      );
      throw Exception(e);
    }

   }
}