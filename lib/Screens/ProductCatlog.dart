import 'package:flutter/material.dart';

class ProductCatlog extends StatefulWidget {
  const ProductCatlog({Key? key}) : super(key: key);

  @override
  _ProductCatlogState createState() => _ProductCatlogState();
}

class _ProductCatlogState extends State<ProductCatlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Product Catlog Page"),
      ),
    );
  }
}
