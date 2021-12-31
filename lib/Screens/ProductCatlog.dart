// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProductCatlog extends StatefulWidget {
  const ProductCatlog({Key? key}) : super(key: key);

  @override
  _ProductCatlogState createState() => _ProductCatlogState();
}

class _ProductCatlogState extends State<ProductCatlog> {
  List<Product> products = [
    Product(
      "DSA Hoodie White",
      "Exclusive DSA Hoodie",
      "assets/Images/DS Front.png",
      100.0,
    ),
    Product("DSA Hoodie Black", "Exclusive DSA Hoodie",
        "assets/Images/DS Back.png", 100.0,
        featured: true),
    Product(
      "Data Science Hoodie ",
      "Exclusive DSA Hoodie",
      "assets/Images/DSA Front.png",
      100.0,
    ),
    Product(
      "Diploma Hoodie",
      "Exclusive DSA Hoodie",
      "assets/Images/DWT Front.png",
      100.0,
    ),
    Product("BSA Hoodie", "Exclusive DSA Hoodie",
        "assets/Images/ESDS Front.png", 100.0,
        featured: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Merchandise Store",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xffD7A74F)),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.search)),
            IconButton(onPressed: null, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      "assets/Images/Sale Banner.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Featured Products', style: TextStyle(fontSize: 22)),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Product featuredProduct = products[index];
                  return featuredProduct.featured
                      ? Card(
                          elevation: 20,
                          shadowColor: Color(0xffD7A74F),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.17,
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Image.asset(
                                    featuredProduct.image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        featuredProduct.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        featuredProduct.description,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        "RS." +
                                            featuredProduct.price.toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: null,
                                              icon: Icon(Icons.shopping_cart)),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            0xff79201B)),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 10,
                                                            horizontal: 8)),
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                              ),
                                              onPressed: null,
                                              child: const Text("Buy Now",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container();
                },
                childCount: products.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('All Products', style: TextStyle(fontSize: 22)),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Product featuredProduct = products[index];
                  return Card(
                    elevation: 20,
                    shadowColor: Color(0xffD7A74F),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Image.asset(
                              featuredProduct.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  featuredProduct.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  featuredProduct.description,
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  "RS." + featuredProduct.price.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.shopping_cart)),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xff79201B)),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 8)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40))),
                                        ),
                                        onPressed: null,
                                        child: const Text("Buy Now",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: products.length,
              ),
            ),
          ],
        )
        // body: SingleChildScrollView(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       ListView(
        //         shrinkWrap: true,
        //         padding: const EdgeInsets.all(8),
        //         children: products
        //             .where((element) => element.featured == true)
        //             .map((featuredProduct) => Card(
        //                   elevation: 20,
        //                   shadowColor: Color(0xffD7A74F),
        //                   shape: RoundedRectangleBorder(
        //                       side: BorderSide(width: 1),
        //                       borderRadius: BorderRadius.circular(10)),
        //                   child: Container(
        //                     width: MediaQuery.of(context).size.width * 0.9,
        //                     height: MediaQuery.of(context).size.height * 0.17,
        //                     child: Row(
        //                       children: [
        //                         Container(
        //                           width: MediaQuery.of(context).size.width * 0.3,
        //                           child: Image.asset(
        //                             featuredProduct.image,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Expanded(
        //                           child: Column(
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 featuredProduct.name,
        //                                 style: TextStyle(
        //                                     fontSize: 20,
        //                                     fontWeight: FontWeight.bold),
        //                               ),
        //                               Text(
        //                                 featuredProduct.description,
        //                                 style: TextStyle(fontSize: 17),
        //                               ),
        //                               Text(
        //                                 "RS." + featuredProduct.price.toString(),
        //                                 style: TextStyle(fontSize: 20),
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   IconButton(
        //                                       onPressed: null,
        //                                       icon: Icon(Icons.shopping_cart)),
        //                                   ElevatedButton(
        //                                       style: ButtonStyle(
        //                                         backgroundColor:
        //                                             MaterialStateProperty.all(
        //                                                 const Color(0xff79201B)),
        //                                         padding:
        //                                             MaterialStateProperty.all(
        //                                                 const EdgeInsets
        //                                                         .symmetric(
        //                                                     vertical: 10,
        //                                                     horizontal: 8)),
        //                                         shape: MaterialStateProperty.all(
        //                                             RoundedRectangleBorder(
        //                                                 borderRadius:
        //                                                     BorderRadius.circular(
        //                                                         40))),
        //                                       ),
        //                                       onPressed: null,
        //                                       child: const Text("Buy Now",
        //                                           style: TextStyle(
        //                                               fontSize: 16,
        //                                               color: Colors.white,
        //                                               fontWeight:
        //                                                   FontWeight.bold))),
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ))
        //             .toList(),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text('All Products', style: TextStyle(fontSize: 22)),
        //       ),
        //       ListView(
        //         shrinkWrap: true,
        //         padding: const EdgeInsets.all(8),
        //         children: products
        //             .map((featuredProduct) => Card(
        //                   elevation: 20,
        //                   shadowColor: Color(0xffD7A74F),
        //                   shape: RoundedRectangleBorder(
        //                       side: BorderSide(width: 1),
        //                       borderRadius: BorderRadius.circular(10)),
        //                   child: Container(
        //                     width: MediaQuery.of(context).size.width * 0.9,
        //                     height: MediaQuery.of(context).size.height * 0.17,
        //                     child: Row(
        //                       children: [
        //                         Container(
        //                           width: MediaQuery.of(context).size.width * 0.3,
        //                           child: Image.asset(
        //                             featuredProduct.image,
        //                             fit: BoxFit.fill,
        //                           ),
        //                         ),
        //                         Expanded(
        //                           child: Column(
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 featuredProduct.name,
        //                                 style: TextStyle(
        //                                     fontSize: 20,
        //                                     fontWeight: FontWeight.bold),
        //                               ),
        //                               Text(
        //                                 featuredProduct.description,
        //                                 style: TextStyle(fontSize: 17),
        //                               ),
        //                               Text(
        //                                 "RS." + featuredProduct.price.toString(),
        //                                 style: TextStyle(fontSize: 20),
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   IconButton(
        //                                       onPressed: null,
        //                                       icon: Icon(Icons.shopping_cart)),
        //                                   ElevatedButton(
        //                                       style: ButtonStyle(
        //                                         backgroundColor:
        //                                             MaterialStateProperty.all(
        //                                                 const Color(0xff79201B)),
        //                                         padding:
        //                                             MaterialStateProperty.all(
        //                                                 const EdgeInsets
        //                                                         .symmetric(
        //                                                     vertical: 10,
        //                                                     horizontal: 8)),
        //                                         shape: MaterialStateProperty.all(
        //                                             RoundedRectangleBorder(
        //                                                 borderRadius:
        //                                                     BorderRadius.circular(
        //                                                         40))),
        //                                       ),
        //                                       onPressed: null,
        //                                       child: const Text("Buy Now",
        //                                           style: TextStyle(
        //                                               fontSize: 16,
        //                                               color: Colors.white,
        //                                               fontWeight:
        //                                                   FontWeight.bold))),
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ))
        //             .toList(),
        //       )
        //       //All Products
        //     ],
        //   ),
        // ),
        );
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
