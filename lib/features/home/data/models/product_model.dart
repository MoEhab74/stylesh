import 'package:stylesh/features/home/data/models/category_model.dart';

class ProductModel {
  final int? id;
  final String? slug;
  final double? price;
  final CategoryModel? category;
  final List<String>? images;

  // Existing UI fields
  final String imageUrl;
  final String title;
  final String description;
  final String currentPrice;
  final String oldPrice;
  final String discount;
  final double rating;
  final int reviewCount;

  const ProductModel({
    this.id,
    this.slug,
    this.price,
    this.category,
    this.images,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.currentPrice,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviewCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final double rawPrice = (json['price'] as num?)?.toDouble() ?? 0.0;
    final List<dynamic>? rawImages = json['images'] as List<dynamic>?;
    final List<String> parsedImages = rawImages?.map((e) => e.toString()).toList() ?? [];
    
    // Fallback image url: first image from images, or placehold image
    final String parsedImageUrl = parsedImages.isNotEmpty 
        ? parsedImages.first 
        : (json['category']?['image'] as String? ?? 'https://placehold.co/150x150');

    return ProductModel(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      price: rawPrice,
      category: json['category'] != null 
          ? CategoryModel.fromJson(json['category'] as Map<String, dynamic>) 
          : null,
      images: parsedImages,
      // Map API fields to UI fields so the existing widgets work perfectly
      imageUrl: parsedImageUrl,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      currentPrice: "₹$rawPrice",
      oldPrice: "₹${(rawPrice * 2).toStringAsFixed(0)}",
      discount: "50% off",
      rating: 4.5, // Default/mock rating
      reviewCount: 150, // Default/mock review count
    );
  }
}