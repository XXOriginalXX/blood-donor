class UserModel {
  final String id;
  final String name;
  final String email;
  final String bloodType;
  final int age;
  final double latitude;
  final double longitude;
  final bool isDonor;
  final bool isAvailable;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.bloodType,
    required this.age,
    required this.latitude,
    required this.longitude,
    required this.isDonor,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'bloodType': bloodType,
      'age': age,
      'latitude': latitude,
      'longitude': longitude,
      'isDonor': isDonor,
      'isAvailable': isAvailable,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      bloodType: map['bloodType'],
      age: map['age'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      isDonor: map['isDonor'],
      isAvailable: map['isAvailable'],
    );
  }
}