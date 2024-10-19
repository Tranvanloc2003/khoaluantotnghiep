import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/loading/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      /// enable loading
      FullScreenLoader.openLoadingDialog(
          "Sending password reset email", TImages.docerAnimation);

      /// check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!forgetPasswordFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Email Sent", message: "Email link sent to reset your password".tr);
      
      Get.to(() => ResetPassword(email: email.text.trim()));
    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      FullScreenLoader.stopLoading();
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// enable loading
      FullScreenLoader.openLoadingDialog(
          "Sending password reset email", TImages.docerAnimation);

      /// check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Email Sent", message: "Email link sent to reset your password".tr);

    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      FullScreenLoader.stopLoading();
    }
  }

}