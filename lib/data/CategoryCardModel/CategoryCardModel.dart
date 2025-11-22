import '../../AppCore/AppImages/AppImages.dart';

class CategoryModel {
  final String? image;
  final String? catNameEn;
  final String? catNameAr;
  final String? id;

  CategoryModel({
    required this.image,
    required this.catNameEn,
    required this.catNameAr,
    required this.id,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      image: AppImages.generalImage,
      catNameEn: 'General',
      catNameAr: 'عام',
      id: 'general',
    ),
    CategoryModel(
      image: AppImages.businessImage,
      catNameEn: 'Business',
      catNameAr: 'أعمال',
      id: 'business',
    ),
    CategoryModel(
      image: AppImages.entertainmentImage,
      catNameEn: 'Entertainment',
      catNameAr: 'ترفيه',
      id: 'entertainment',
    ),
    CategoryModel(
      image: AppImages.healthImage,
      catNameEn: 'Health',
      catNameAr: 'صحه',
      id: 'health',
    ),
    CategoryModel(
      image: AppImages.scienceImage,
      catNameEn: 'Science',
      catNameAr: 'علوم',
      id: 'science',
    ),
    CategoryModel(
      image: AppImages.technologyImage,
      catNameEn: 'Technology',
      catNameAr: 'تكنولوجيا',
      id: 'technology',
    ),
    CategoryModel(
      image: AppImages.sportsImage,
      catNameEn: 'Sports',
      catNameAr: 'رياضة',
      id: 'sports',
    ),
  ];
}
