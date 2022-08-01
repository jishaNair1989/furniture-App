import 'package:flutter/material.dart';
import 'package:my_furniture_app/models/cart.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: Cart.cartItems.length,
      itemBuilder: (context, index) {

      final data = Cart.cartItems[index];
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Dismissible(
          key: Key(data.product.id.toString()),
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: const [
                Spacer(),
                Icon(
                  Icons.delete,
                  color: Colors.brown,
                ),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),

            child: Row(
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
                )
              ],
            ),
          ),
        ),
      );
      }
    );
  }
}
