import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';



Future<void> main() async {
// Todo: Thêm Widgets Binding
final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
// Todo: Khởi tạo Local Storage
await  GetStorage.init();
// Todo: Khởi tạo phương thức thanh toán

// Todo: Chờ Native Splash
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
// Todo: Khởi tạo Firebase
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
).then((FirebaseApp value) => Get.put(AuthenticationRepository()));


// Todo: Khởi tạo Authentication

  runApp(const App());
}
