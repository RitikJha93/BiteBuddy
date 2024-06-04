class CartItem {
  String id;
  String name;
  int quantity;
  String image;
  double price;

  CartItem(
      {required this.name,
      required this.quantity,
      required this.image,
      required this.id,
      required this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        image: json["image"],
        price: json["price"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "image": image,
      "quantity": quantity,
    };
  }
}
