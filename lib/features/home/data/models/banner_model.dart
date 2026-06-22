class BannerModel {
  final String discountText;
  final String productTitle;
  final String subtitle;
  final String imagePath;

  BannerModel({
    required this.discountText,
    required this.productTitle,
    required this.subtitle,
    required this.imagePath,
  });
}

// Sample banner data
    final banners = [
      BannerModel(
        discountText: "50-40% OFF",
        productTitle: "Summer Collection",
        subtitle: "All colours",
        imagePath: "assets/images/onboarding1.png", // Using existing image
      ),
      BannerModel(
        discountText: "30% OFF",
        productTitle: "Winter Wear",
        subtitle: "Limited time",
        imagePath: "assets/images/onboarding2.png", // Using existing image
      ),
      BannerModel(
        discountText: "Buy 2 Get 1 FREE",
        productTitle: "Accessories",
        subtitle: "All items",
        imagePath: "assets/images/onboarding3.png", // Using existing image
      ),
    ];