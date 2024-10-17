import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/loading/animation_loader_widget.dart';
import 'package:t_store/utils/loading/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
    final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// --- SIGNUP
   Future<void> emailAndPasswordLogin() async {
    try {
      /// enable loading
      FullScreenLoader.openLoadingDialog(
          "Logging you in...", TImages.docerAnimation);

      /// check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!loginFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      /// remember me
      if(rememberMe.value){
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      print('| ${email.text} .|. ${password.text} |');

      /// register
      final userCredential =
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      TLoaders.successSnackBar(
        title: "Success",
        message: "Login successful",
      );

      FullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      FullScreenLoader.stopLoading();
    }
  }
  Future<void> googleSignIn() async{
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          "Logging you in...", TImages.docerAnimation);

          //check connectivity
          final isConnected = await NetworkManager.instance.isConnected();
          if (!isConnected) {
            FullScreenLoader.stopLoading();
            return;
          }
          //google authentication
          final userCredential = await AuthenticationRepository.instance.signInWithGoogle();
          //save user record
          await userController.saveUserData(userCredential);
          //stop loading
          FullScreenLoader.stopLoading();
          //next page
          AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      
    }
  }
}