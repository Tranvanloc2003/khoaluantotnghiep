import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carouselCurrentindex = 0.obs;

  void updateCarouselIndex(int index) {
    carouselCurrentindex.value = index;
  }
}