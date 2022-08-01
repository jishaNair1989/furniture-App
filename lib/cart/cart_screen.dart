import 'package:flutter/material.dart';
import 'package:my_furniture_app/cart/components/cart_item_body.dart';
import 'package:my_furniture_app/cart/components/cartbody.dart';
import 'package:my_furniture_app/checkout.dart';
import 'package:my_furniture_app/models/cart.dart';

class CartScreen extends StatelessWidget {
  // static String routeName = "/cart";
  final Image? cartImage;
   CartScreen({Key? key, this.cartImage}) : super(key: key);
  ValueNotifier<List<Cart>> cartNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body:   const CartItemCard(),
        bottomNavigationBar: const CheckoutCard());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          const Text(
            'Shopping Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "{demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),

        ],
      ),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 20,
            color: Colors.amberAccent.shade200.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Total: \$3465',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CheckOut();
                    },
                  ),
                );
              },
              child: const Text('Check Out'),
            )
          ],
        ),
      ),
    );
  }
}
