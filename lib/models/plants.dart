class Plants {
  late int id;
  late String name;
  late String imagePath;
  late String category;
  late String description;
  late double price;
  late bool isFavorit;
  Plants({
    required this.id,
    required this.category,
    required this.description,
    required this.imagePath,
    required this.isFavorit,
    required this.name,
    required this.price,
  });
}
