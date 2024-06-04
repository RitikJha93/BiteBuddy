import 'package:bitebuddy/features/shop/models/restaurant/food_model.dart';

class RestaurantDetail {
  String? id;
  String? name;
  String? address;
  String? thumbnail;
  double? rating;
  List<Food>? menu;

  RestaurantDetail(
      {this.name,
      this.address,
      this.thumbnail,
      this.rating,
      this.menu,
      this.id});

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      thumbnail: json["thumbnail"],
      rating: json["rating"],
      menu: json["menu"],
    );
  }
}
