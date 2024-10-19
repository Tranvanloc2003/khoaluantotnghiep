import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_models.dart';
import 'package:t_store/utils/popups/loaders.dart';


class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModels> allCategories = <CategoryModels>[].obs;
  RxList<CategoryModels> featuredCategories = <CategoryModels>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
Future<void> fetchCategories() async {
  try {
    // Show loader while loading categories
    isLoading.value = true;

    // Fetch categories from data source (Firestore, API, etc.)
    final categories = await _categoryRepository.getAllCategories();

    // Update the categories list
    allCategories.assignAll(categories);

    // Filter featured categories
    featuredCategories.assignAll(
      allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList(),
    );
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  } finally {
    // Remove Loader
    isLoading.value = false;
  }
}

}
