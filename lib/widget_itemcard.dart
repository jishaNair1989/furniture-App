import 'package:flutter/material.dart';
import 'package:my_furniture_app/cart/cart_screen.dart';
import 'package:my_furniture_app/databaseHandler/db_functions.dart';
import 'package:my_furniture_app/models/product.dart';
import 'package:my_furniture_app/product_view.dart';

Widget itemCard(Product product, bool isFavorite, BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,

      ),
      child: Row(
        children: [
          Container(
            width: 70.0,
            height: 90.0,
            decoration: BoxDecoration(
              image:
              DecorationImage(image: NetworkImage(product.image), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 20,),
          //
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontFamily: 'gabriela',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 60.0,
                    // ),
                    Material(
                      elevation: isFavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isFavorite
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.white),
                        child: Center(
                          child: isFavorite
                              ? const Icon(Icons.favorite_border)
                              : const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 130.0,
                  child: Text(
                    product.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'gabriela',
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('\$${product.price.toString()}'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // listTables();
                        addToCart(product.id,1);
                        // print(product.id);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return CartScreen(
                        //         // cartImage: product.image,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      child: const Text(
                        'Add to Cart',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ProductDetailsScreen(
            productModel: product,
          );
        }
        ),
      );
    },
  );
}

addToCart(int productId, int userId) async {
  await db.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO cart(productId, userId) VALUES(?,?)',[productId, userId]);

  });
}

listTables() async {
  List<Map<String, dynamic>> tables = await db
      .query('sqlite_master');


}