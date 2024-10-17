import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/loading/full_screen_loader.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // hidePassword cuar hidePassword
  final privacyPolicy = true.obs; // privacyPolicy cuar nut checkbox
  final email = TextEditingController(); // controller cuar email
  final lastName = TextEditingController(); // controller cuar lastName
  final username = TextEditingController(); // controller cuar username
  final password = TextEditingController(); // controller cuar password
  final firstname = TextEditingController(); // controller cuar firstname
  final phoneNumber = TextEditingController(); // controller cuar phoneNumber
  GlobalKey<FormState> signupFormkey =
      GlobalKey<FormState>(); // formKey cuar form
  /// --- SIGNUP
  void signup() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormkey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Chấp nhận Chính sách Quyền riêng tư',
            message:
                'Để tạo tài khoản, bạn cần phải đọc và chấp nhận Chính sách Quyền riêng tư & Điều khoản Sử dụng.');
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
   final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim(),);

      // Save Authenticated user data in the Firebase Firestore
     final newUser = UserModel(id: userCredential.user!.uid, firstName: firstname.text.trim(), lastName: lastName.text.trim(), username: username.text.trim(), email: email.text.trim(), phoneNumber: phoneNumber.text.trim(), profilePicture: '');
     final userRepository = Get.put(UserRepository());
     userRepository.saveUserRecord(newUser);
      // Show Success Message
TLoaders.successSnackBar(title: 'Đăng ký thành công', message: 'Chúc mừng bạn đã đăng ký tài khoản thành công. Vui lòng kiểm tra email của bạn để xác minh tài khoản.');
      // Move to Verify Email Screen
        // TFullScreenLoader.stopLoading();
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
       // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } 
  }
}
