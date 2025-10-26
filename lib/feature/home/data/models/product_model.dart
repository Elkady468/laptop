
class ProductModel {
  final String status, category, name;
  final num price;
  final String description;
  final String image;
  final List<dynamic> images;
  final String company;
  final int countInStock;
  final String id;

  ProductModel({
    required this.id,
    required this.countInStock,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"],
      status: json['status'],
      category: json['category'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      images: json['images'],
      company: json['company'],
      countInStock: json['countInStock'],
    );
  }
}

class CartModel {
  final String status, category, name;
  final num price;
  final String description;
  final String image;
  final List<dynamic> images;
  final String company;
  final int countInStock;
  final String id;
  final int quantity;
  final double totalPrice;
  final int sales;
  CartModel({
    required this.quantity,
    required this.totalPrice,
    required this.sales,
    required this.id,
    required this.countInStock,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["_id"] ?? '',
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      images: json['images'] ?? [],
      company: json['company'] ?? '',
      countInStock: json['countInStock'] ?? 0,
      quantity: json['quantity'] ?? 0,
      // هنا التحويل المهم
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      sales: json["sales"] ?? 0,
    );
  }
}
