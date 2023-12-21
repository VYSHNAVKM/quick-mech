class UserModel {
  String? name;
  String? email;
  String? mobile;
  String? image;
  UserModel({this.name, this.email, this.mobile, this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "image": image,
      };
}
