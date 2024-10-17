import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen.dart/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  // Functions
  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send code verification email
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();

      TLoaders.successSnackBar(
          title: 'Email Sent',
          message:
              'A verification email has been sent to your email address. Please verify your email address to continue.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //time to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await _auth.currentUser?.reload();
      final user = _auth.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
              image: TImages.successMailAnimation,
            ));
      }
    });
  }
  //check if email is verified
  checkEmailVerificationStatus() async{
    final currentUser = _auth.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
       Get.off(() => SuccessScreen(
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),//tro ve loginscreen
              image: TImages.successMailAnimation,
            ));
    }
  }
}
