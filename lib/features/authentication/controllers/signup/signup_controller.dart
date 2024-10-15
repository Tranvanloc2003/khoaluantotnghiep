import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
final email = TextEditingController(); // controller cuar email
final lastName = TextEditingController(); // controller cuar lastName
final username = TextEditingController(); // controller cuar username
final password = TextEditingController(); // controller cuar password
final firstname = TextEditingController(); // controller cuar firstname
final phoneNumber = TextEditingController(); // controller cuar phoneNumber
GlobalKey<FormState> signupFormkey = GlobalKey<FormState>(); // formKey cuar form
  /// --- SIGNUP
  Future<void> signup() async {
    try {
      // Start Loading
      
      // Check Internet Connectivity

      // Form Validation

      // Privacy Policy Check

      // Register user in the Firebase Authentication & Save user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Show Success Message

      // Move to Verify Email Screen
    } catch (e) {
      // Show some Generic Error to the user
    } finally {
      // Remove Loader
    }
  }
}
