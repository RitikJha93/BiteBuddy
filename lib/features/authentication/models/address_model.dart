class Address {
  String? id;
  String? address;

  Address({required this.id, required this.address});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(id: json["id"], address: json["address"]);
  }

  
}
