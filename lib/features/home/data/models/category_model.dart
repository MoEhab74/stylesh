class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String? image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      image:
          json['image'] as String? ??
          'https://static.vecteezy.com/system/resources/previews/005/332/574/non_2x/hola-in-heart-bubble-free-vector.jpg',
    );
  }
}
