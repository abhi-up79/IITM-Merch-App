import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreProvider() {
    fetchProducts();
  }

  List<Product> products = [
    // Product(
    //   "DSA Hoodie White",
    //   "Exclusive DSA Hoodie",
    //   "assets/Images/DS Front.png",
    //   100.0,
    // ),
    // Product("DSA Hoodie Black", "Exclusive DSA Hoodie",
    //     "assets/Images/DS Back.png", 100.0,
    //     featured: true),
    // Product(
    //   "Data Science Hoodie ",
    //   "Exclusive DSA Hoodie",
    //   "assets/Images/DSA Front.png",
    //   100.0,
    // ),
    // Product(
    //   "Diploma Hoodie",
    //   "Exclusive DSA Hoodie",
    //   "assets/Images/DWT Front.png",
    //   100.0,
    // ),
    // Product("BSA Hoodie", "Exclusive DSA Hoodie",
    //     "assets/Images/ESDS Front.png", 100.0,
    //     featured: true),
  ];

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance.collection('Products').get().then((value) {
      value.docs.forEach((doc) {
        Product product = Product(doc['name'], doc['description'], doc['image'],
            double.parse(doc['price'].toString()),
            featured: doc['featured']);
        products.add(product);
      });
    });
    notifyListeners();
  }

  void updateCart(Product p) {
    products.forEach((element) {
      if (element.name == p.name) {
        element.addedToCart = !element.addedToCart;
        notifyListeners();
      }
    });
  }

  Future<void> purchase() async {
    //Payment logic
  }
}

class Product {
  String name;
  String description;
  String image;
  double price;
  bool featured;
  bool addedToCart;
  Product(this.name, this.description, this.image, this.price,
      {this.featured = false, this.addedToCart = false});
}
