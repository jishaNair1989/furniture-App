import 'package:flutter/material.dart';
import 'package:my_furniture_app/databaseHandler/db_functions.dart';
import 'package:my_furniture_app/models/cart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    this.cart,
  }) : super(key: key);
  final Cart? cart;

  @override
  Widget build(BuildContext context) {
    getCartItem();
    // print(Cart.cartItems);

    return ListView.builder(
      itemBuilder: ((context, index) {
        final data = Cart.cartItems[index];
        //  return Text(data.product.title);

        return Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: AspectRatio(
                  aspectRatio: .88,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Image.network(data.product.image),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.product.title,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      text: "\$${data.product.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.amber),
                      children: [
                        TextSpan(
                            text: " x ${data.quantity}",
                            style: const TextStyle(color: Colors.black87)),
                      ],
                    ),
                  )
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                iconSize: 30.0,
                onPressed: () {
                  deleteCartItem(data.product.id);
                },
              ),
            ],
          ),
        );
      }),
      itemCount: Cart.cartItems.length,
    );
  }
}
