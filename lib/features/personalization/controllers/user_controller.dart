import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
final userRepository = Get.put(UserRepository());
  //save user data from any Register provider google
  Future<void> saveUserData(UserCredential? userCredential) async{
    try {
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
}