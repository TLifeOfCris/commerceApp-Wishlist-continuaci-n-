class Product{

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isLiked;

  Product({
    required this.id, 
    required this.title,
    this.description = '',
    required this.price,
    this.imageUrl = '',
    this.isLiked = false,
  });
}