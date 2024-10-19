import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModels {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModels({
    required this.id,
    required this.image,
    required this.name,
    
    required this.isFeatured,
    this.parentId = '',
  });
  //empty Helper function
  static CategoryModels empty() => CategoryModels(
      id: '', image: '', name: '', parentId: '', isFeatured: false);

  // Convert model to Json structure so that you can store data in Firebase
Map<String, dynamic> toJson() {
  return {
    'Name': name,
    'Image': image,
    'ParentId': parentId,
    'IsFeatured': isFeatured,
  };
}

// Map JSON oriented document snapshot from Firebase to UserModel
factory CategoryModels.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  if (document.data() != null) {
    final data = document.data()!;

    // Map JSON Record to the Model
    return CategoryModels(
      id: document.id,
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      parentId: data['ParentId'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
    );
  } else {
    return CategoryModels.empty();
  }
}

}
