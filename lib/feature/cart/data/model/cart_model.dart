class AddToCartResponse {
  final String message;
  final User user;

  AddToCartResponse({
    required this.message,
    required this.user,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user.toJson(),
      };
}

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String profileImage;
  final String gender;
  final String password;
  final String token;
  final bool isAdmin;
  final List<String> favoriteProducts;
  final List<CartItem> inCart;
  final int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.profileImage,
    required this.gender,
    required this.password,
    required this.token,
    required this.isAdmin,
    required this.favoriteProducts,
    required this.inCart,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      nationalId: json['nationalId'],
      profileImage: json['profileImage'],
      gender: json['gender'],
      password: json['password'],
      token: json['token'],
      isAdmin: json['isAdmin'],
      favoriteProducts:
          List<String>.from(json['favoriteProducts'].map((x) => x)),
      inCart: List<CartItem>.from(
          json['inCart'].map((x) => CartItem.fromJson(x))),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'nationalId': nationalId,
        'profileImage': profileImage,
        'gender': gender,
        'password': password,
        'token': token,
        'isAdmin': isAdmin,
        'favoriteProducts': favoriteProducts,
        'inCart': inCart.map((x) => x.toJson()).toList(),
        '__v': v,
      };
}

class CartItem {
  final String product;
  final int quantity;
  final String id;

  CartItem({
    required this.product,
    required this.quantity,
    required this.id,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: json['product'],
      quantity: json['quantity'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product,
        'quantity': quantity,
        '_id': id,
      };
}
