class Restaurant {
  String id;
  String? name;
  String? address;
  String? image;
  double? rating;
  String? location;
  bool? isActive;
  String? phoneNumber;
  String? ownerId;
  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    required this.location,
    required this.rating,
    required this.isActive,
    required this.phoneNumber,
    required this.ownerId,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      image: json["thumbnail"],
      location: json["city"],
      rating: json["rating"],
      isActive: json["is_active"],
      phoneNumber: json["phone_number"],
      ownerId: json["owner_id"],
    );
  }
}
