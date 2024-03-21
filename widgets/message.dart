import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
class Message{
   static void correctMessage()
   {
       QuickAlert.show(
                    context: Get.context!,
                    type: QuickAlertType.success,
                    text: 'Login Successfull',
           ); 
      
   }

     static void incorrectMessage()
   {
       QuickAlert.show(
                    context: Get.context!,
                    type: QuickAlertType.error,
                    text: 'Login Successfull',
           ); 
      
   }
}