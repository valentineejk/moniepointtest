class ProductData {
  final String category;
  final String title;
  final String image;
  final List images;
  final String desc;

  final double rating;
  final int sold;
  final double price;
  ProductData({
    required this.category,
    required this.title,
    required this.image,
    required this.images,
    required this.desc,
    required this.rating,
    required this.sold,
    required this.price,
  });
}
