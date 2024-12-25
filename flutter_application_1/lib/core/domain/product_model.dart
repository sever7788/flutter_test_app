class ProductModel {
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.thumbnail});

  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final String thumbnail;
}
