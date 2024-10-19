import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/controllers/re_authenticate_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/loading/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
final userRepository = Get.put(UserRepository());
final profileLoading = false.obs;
final imageUploading = false.obs;
final hidePassword = false.obs;
final verifyEmail = TextEditingController();
final verifyPassword = TextEditingController();
GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
@override
void onInit(){
  super.onInit();
  fetchUserRecord();
}
//delete user account
void deleteAccountWarningPopup(){
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(TSizes.md),
    title: 'Delete Account',
    middleText: 'Are you sure you want to delete your account?',
    confirm: ElevatedButton(onPressed: () async => deleteUserAccount(), style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: BorderSide(color: Colors.red),),child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
      child: Text('Delete'),
    ),),
    cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: Text('Cancel'),
    ),
  );
}

 Future<void> deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);
      final auth = AuthenticationRepository.instance;
      final providers = auth.authUser!.providerData.map((e) => e.providerId);
      if (providers.isNotEmpty) {
        if (providers.contains("google.com")) {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (providers.contains("password")) {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh snap!", message: e.toString());
    }
  }

   void reAuthenticateEmailAndPassword() async {
    try {
      FullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
Future<void> fetchUserRecord() async {
  try {
   profileLoading.value = true;
   final user =  await userRepository.fetchUserDetails();
    this.user(user);
  } catch (e) {
    user(UserModel.empty());
  }finally{
    profileLoading.value = false;
  }
}
  //save user data from any Register provider google
  Future<void> saveUserData(UserCredential? userCredential) async{
    try {
      //refresh user data
    await fetchUserRecord();

      if (userCredential != null) {
        //convert name to first and last name
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');
        //map user data
        final user = UserModel(id: userCredential.user!.uid, firstName: nameParts[0], lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' '): '', username: username, email:userCredential.user!.email ?? '', phoneNumber: userCredential.user!.phoneNumber ?? '', profilePicture: userCredential.user!.photoURL ?? '');
        //save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong while saving user data');
    }
  }

  /// Upload Profile Image
uploadUserProfilePicture() async {
  try {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (image != null) {
      // Upload Image
      final imageURL = await userRepository.uploadImage('Users/Images/Profile/', image);

      // Update User Image Record
      Map<String, dynamic> json = {'ProfilePicture': imageURL};
      await userRepository.updateSingleField(json);

      user.value.profilePicture = imageURL;
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your Profile Image has been updated!',
      );
    }
  } catch (e) {
    TLoaders.errorSnackBar(
      title: 'OhSnap',
      message: 'Something went wrong: $e',
    );
  }
}

}