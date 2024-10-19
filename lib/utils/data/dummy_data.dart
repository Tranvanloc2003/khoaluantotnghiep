import 'package:t_store/features/authentication/models/address_model.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/features/shop/models/category_models.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  // static final List<BannerModel> banners = [
  //   BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
  //   BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
  //   BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
  //   BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
  //   BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
  //   BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
  //   BannerModel(imageUrl: TImages.banner7, targetScreen: TRoutes.checkout, active: false),
  // ];

  // static final UserModel user = UserModel(
  //     id: id,
  //     firstName: "Eben",
  //     lastName: "Ahurein",
  //     username: "@ahurein",
  //     email: "ahurei@gmail.com",
  //     phoneNumber: "0553166",
  //     profilePicture: TImages.user,
  //     address: [
  //       AddressModel(
  //         id: "1",
  //         name: "ahurein",
  //         phoneNumber: "+233025544",
  //         street: "takoradi",
  //         city: "Westeer",
  //         state: "new state",
  //         postalCode: "+233",
  //         country: "ghana",
  //       )
  //     ]);

      /// List of all Categories
static final List<CategoryModels> categories = [
  CategoryModels(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
  CategoryModels(id: '2', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
  CategoryModels(id: '3', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
  CategoryModels(id: '4', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
  CategoryModels(id: '5', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
  CategoryModels(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
  CategoryModels(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
  CategoryModels(id: '8', image: TImages.jeweleryIcon, name: 'Jewelry', isFeatured: true),

  // Subcategories
  CategoryModels(id: '9', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
  CategoryModels(id: '10', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
  CategoryModels(id: '11', image: TImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),

  CategoryModels(id: '12', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '2', isFeatured: false),
  CategoryModels(id: '13', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '2', isFeatured: false),
  CategoryModels(id: '14', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '2', isFeatured: false),

  // Electronics
  CategoryModels(id: '15', image: TImages.electronicsIcon, name: 'Laptop', parentId: '3', isFeatured: false),
  CategoryModels(id: '16', image: TImages.clothIcon, name: 'Shirt', parentId: '3', isFeatured: false),
];

}
