class ProductModel {
  String? name, size, description, image, color ,productID,price;

  ProductModel(
      {this.name,
      this.image,
      this.size,
      this.color,
      this.description,
      this.price,this.productID});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    name = map['name'];
    image = map['image'];
    description = map['description'];
    size = map['size'];
    color = map['color'];
    price = map['price'];
    productID = map['productID'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'size': size,
      'color': color,
      'price': price,
      'productID':productID
    };
  }
}
