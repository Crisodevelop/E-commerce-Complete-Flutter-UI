class ProductModel {
  String? name, image, description, sized, color;
  // Color? color;
  bool? isFavourite, isPopular;
  double? rating, price;

  ProductModel(
      {this.name,
      this.image,
      this.rating,
      this.isFavourite,
      this.isPopular,
      this.description,
      this.color,
      this.sized,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    rating = map['rating'];
    isFavourite = map['isFavourite'];
    isPopular = map['isPopular'];
    description = map['description'];
    color = map['color'];
    sized = map['sized'];
    price = map['price'];
    // color = HexColor.fromHex(map['color']);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
