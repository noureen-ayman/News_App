import '../../AppCore/AppImages/AppImages.dart';

class CategoryModel {
  final String? image;
  final String? catName;
  final String? id;

  CategoryModel({required this.image, required this.catName, required this.id});

  static List<CategoryModel> categories = [
    CategoryModel(
      image: AppImages.generalImage,
      catName: 'General',
      id: 'general',
    ),
    CategoryModel(
      image: AppImages.businessImage,
      catName: 'Business',
      id: 'business',
    ),
    CategoryModel(
      image: AppImages.entertainmentImage,
      catName: 'Entertainment',
      id: 'entertainment',
    ),
    CategoryModel(
      image: AppImages.healthImage,
      catName: 'Health',
      id: 'health',
    ),
    CategoryModel(
      image: AppImages.scienceImage,
      catName: 'Science',
      id: 'science',
    ),
    CategoryModel(
      image: AppImages.technologyImage,
      catName: 'Technology',
      id: 'technology',
    ),
    CategoryModel(
      image: AppImages.sportsImage,
      catName: 'Sports',
      id: 'sports',
    ),
  ];
}
