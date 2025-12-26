class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  final bool isFeatured;
  final bool isBestSeller;
  final bool isSpecialOffer;

  final double rating;
  final int soldCount;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.isFeatured,
    required this.isBestSeller,
    required this.isSpecialOffer,
    required this.rating,
    required this.soldCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      description: json['description'] ?? '',

      isFeatured: json['isFeatured'] ?? false,
      isBestSeller: json['isBestSeller'] ?? false,
      isSpecialOffer: json['isSpecialOffer'] ?? false,

      rating: (json['rating'] as num).toDouble(),
      soldCount: json['soldCount'] ?? 0,
    );
  }
}
