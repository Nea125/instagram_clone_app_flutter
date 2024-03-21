import 'package:get/get.dart';
import 'package:instagram_clone_app/screens/main_screen.dart';

void NextScreen()
{
    Get.offAll(()=>const MainScreen());
}