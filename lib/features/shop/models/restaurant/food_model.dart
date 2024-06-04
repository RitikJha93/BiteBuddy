class Food {
  String id;
  String? name;
  String? image;
  String? description;
  String? category;
  bool? isVeg;
  String? price;
  String? restaurantId;

  Food(this.id, this.name, this.image, this.description, this.category,
      this.price, this.isVeg, this.restaurantId);

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(json["id"], json["name"], json["image"], json["description"],
        json["category"], json["price"], json["is_veg"], json["restaurant_id"]);
  }
}
