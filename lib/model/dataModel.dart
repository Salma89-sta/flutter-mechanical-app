
class UserDetailsModel {
  final String name;
  final String phone;
  final String carType;
  final String carColor;
  final String carModel;
  UserDetailsModel({required this.name, required this.phone, required this.carType, required this.carColor, required this.carModel});

  Map<String, dynamic> getJson() => {
    'name': name,
    'address': phone,
  };
  factory UserDetailsModel.getModelFromJson(Map<String, dynamic> json) {
    return UserDetailsModel(name: json["name"], phone: json["phone"], carType: json["carType"],carColor: json["carColor"], carModel: json["carModel"] );
  }
}
