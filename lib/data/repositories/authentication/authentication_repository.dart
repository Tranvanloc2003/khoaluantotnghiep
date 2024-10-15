import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get to => Get.find();

  //varialble
  final deviceStorage = GetStorage();

  //called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }



  //function to show relevant Screen
  screenRedirect() async {
    if(kDebugMode){
      print('-----------------Debug Mode Get Storage-----------------');
      print(deviceStorage.read('isFirstTime'));
    }
    //khi da luowt app lan dau tien thi chuyen den OnBoardingScreen
    //va luu lai trang thai lan dau tien la loginScreen chu khong phai la OnBoardingScreen
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()):Get.offAll(() => const OnBoardingScreen(),);
  }
}

//-----------------------------------Email & Password sign-in----------------------------------------//

//[Email Authentication] - [Sign-in]

//[Email Authentication] - REGISTER
