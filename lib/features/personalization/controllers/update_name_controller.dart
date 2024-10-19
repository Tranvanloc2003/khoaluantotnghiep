import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/loading/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController{
static UpdateNameController get instance => Get.find();
final firstname = TextEditingController();
final lastname = TextEditingController();
final userController = UserController.instance;
final userRepository = Get.put(UserRepository());
GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
@override
void onInit() {
  super.onInit();
  initializeNames();
}
Future<void>initializeNames()async{
  firstname.text = userController.user.value.firstName;
  lastname.text = userController.user.value.lastName;
}
Future<void> updateUserName() async {
    try {
      /// enable loading
      FullScreenLoader.openLoadingDialog(
          "We are updating you information", TImages.docerAnimation);

      /// check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!updateUserNameFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name  = {"FirstName": firstname.text.trim(), "LastName": lastname.text.trim() };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName =  firstname.text.trim();
      userController.user.value.lastName =  lastname.text.trim();

      FullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Congratulations", message: "Your name has been updated".tr);

      Get.to(() => ProfileScreen());
    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      FullScreenLoader.stopLoading();
    }
  }

}