import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iit_madras_merchandise/providers/StoreProvider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);

    storeProvider.products.forEach((element) {
      if (element.addedToCart == true) {
        setState(() {
          amount += element.price;
        });
      }
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    debugPrint('Payment Got Success ${response.paymentId}');
    createOrder(response);
  }

  Future<void> createOrder(PaymentSuccessResponse response) async {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    var orderData = {
      "paymentDate": new DateTime.now(),
      "paymentId": response.paymentId,
      "amount": amount,
      "products": storeProvider.products.map((element) {
        if (element.addedToCart) return element.name;
      }).toList(),
      "email": FirebaseAuth.instance.currentUser!.email
    };
    await FirebaseFirestore.instance.collection('Orders').add(orderData);

    Navigator.pop(context);

    storeProvider.products.forEach((element) {
      if (element.addedToCart) storeProvider.updateCart(element);
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    debugPrint('Payment Got Failed ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  double amount = 0.0;

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ListView(
              children: storeProvider.products.map((e) {
                return e.addedToCart == true
                    ? ListTile(
                        leading: Image.asset(e.image),
                        title: Text('${e.name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${e.description}'),
                            Text(
                              '${e.price}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: e.addedToCart == false
                              ? Icon(Icons.shopping_cart)
                              : Icon(Icons.delete),
                          onPressed: () {
                            storeProvider.updateCart(e);
                          },
                        ),
                      )
                    : Container();
              }).toList(),
            ),
            Positioned(
              bottom: 30,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total Amount : ${amount} \t Qty: ${storeProvider.products.where((element) => element.addedToCart == true).length} ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff79201B)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                      ),
                      onPressed: () async {
                        var options = {
                          'key': 'rzp_test_VhU35hJUXLnImL',
                          'amount': amount * 100,
                          'name': 'IITM Merch Store',
                          'description': 'Swags',
                          'prefill': {
                            'contact': '8433125378',
                            'email': 'test@razorpay.com'
                          }
                        };
                        try {
                          _razorpay.open(options);
                        } catch (e) {}
                      },
                      child: const Text("Purchase",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
