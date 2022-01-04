// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iit_madras_merchandise/providers/StoreProvider.dart';
import 'package:provider/provider.dart';

import 'CartPage.dart';

class ProductCatlog extends StatelessWidget {
  const ProductCatlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (context, storeProvider, child) {
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
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CartPage()));
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 32,
                    ))
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
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
                    child: Text('Featured Products',
                        style: TextStyle(fontSize: 22)),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Product product = storeProvider.products[index];
                      return product.featured
                          ? Card(
                              elevation: 20,
                              shadowColor: Color(0xffD7A74F),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Image.asset(
                                        product.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            product.description,
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Text(
                                            "RS." + product.price.toString(),
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    storeProvider
                                                        .updateCart(product);
                                                  },
                                                  icon: !product.addedToCart
                                                      ? Icon(
                                                          Icons.shopping_cart,
                                                          size: 36,
                                                        )
                                                      : Icon(
                                                          Icons.delete,
                                                          size: 36,
                                                          color: Colors.red,
                                                        )),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(const Color(
                                                                0xff79201B)),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all(const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10,
                                                                horizontal: 8)),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40))),
                                                  ),
                                                  onPressed: null,
                                                  child: const Text("Buy Now",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .bold))),
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
                    childCount: storeProvider.products.length,
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
                      Product product = storeProvider.products[index];
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
                                  product.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      product.description,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      "RS." + product.price.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              storeProvider.updateCart(product);
                                            },
                                            icon: !product.addedToCart
                                                ? Icon(
                                                    Icons.shopping_cart,
                                                    size: 36,
                                                  )
                                                : Icon(Icons.delete,
                                                    size: 36,
                                                    color: Colors.red)),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xff79201B)),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 8)),
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
                      );
                    },
                    childCount: storeProvider.products.length,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
