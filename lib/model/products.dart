class Product {
  String? title;
  double? price;
  String? description;
  String? image;
  Rating? rating;

  Product({this.title, this.price, this.description, this.image, this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    description = json['description'];

    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['price'] = price;
    data['description'] = description;

    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;
  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}

List<Product> products = [
  Product(
    title: "HC-SR04 Ultrasonic SensorHC-SR04 Ultrasonic Sensor",
    price: 109.95,
    description:
    "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    image: "assets/images/one.png",
    rating: Rating(rate: 3.9, count: 120),
  ),
  Product(
    title: "Arduino Mega 2560 R3",
    price: 22.3,
    description:
    "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
    image: "assets/images/two.png",
    rating: Rating(rate: 4.1, count: 259),
  ),
  Product(
    title: "Micro Servo MG90SMicro Servo MG90S",
    price: 55.99,
    description:
    "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
    image: "assets/images/three.png",
  ),
  Product(
    title: "Micro Servo MG90SMicro Servo MG90S",
    price: 55.99,
    description:
    "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
    image: "assets/images/three.png",
  ),
  Product(
    title: "Micro Servo MG90SMicro Servo MG90S",
    price: 55.99,
    description:
    "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
    image: "assets/images/three.png",
  ),
  Product(
      title: "Arduino Nano",
      price: 15.99,
      description:
      "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
      image: "assets/images/four.png",
      rating: Rating(rate: 2.1, count: 430))
];