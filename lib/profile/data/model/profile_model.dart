class ProfileModel {
  final String name;
  final String email;
  final String image, phone, id, gender, token;

  ProfileModel({
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.id,
    required this.gender,
    required this.token,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json["name"],
      email: json['email'],
      image: json['profileImage'],
      phone: json['phone'],
      id: json['nationalId'],
      gender: json['gender'],
      token: json['token'],
    );
  }
}
