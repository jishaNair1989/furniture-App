import 'package:flutter/material.dart';
import 'package:my_furniture_app/databaseHandler/db_functions.dart';
import 'package:my_furniture_app/models/cart.dart';
import 'package:my_furniture_app/models/product.dart';

class Cart {
  final int id;
  final int userId;
  final Product product;
  final int? quantity;
  Cart(this.userId,
      {required this.id, required this.product, required this.quantity});

  static Future<Cart> fromMap(Map<String, Object?> map) async {
    final id = map['Id'] as int;
    final userId = map['userId'] as int;
    final productId = map['productId'] as int;
    print(productId.toString());

    late Product product;
    await getProduct(productId).then((pro) {
      product = pro;
      print('from then ${product.title}');
    });
    print('title');
    print(product.title);
    final quantity = ValueNotifier(['quantity']);


    return Cart(
      userId,
      id: id,
      quantity: 1,
      product: product,
    );
  }

  static List<Cart> cartItems = [];
  static getCartItem() async {
    final cartList =
        await db.rawQuery("SELECT * FROM cart WHERE userId = ?", [1]);
    for (var cart in cartList) {
      late Cart cartItem;
      await Cart.fromMap(cart).then((value) => cartItem = value);

      Cart.cartItems.add(cartItem);
    }
  }

  static Future<Product> getProduct(int productId) async {
    final productDb =
        await db.rawQuery("SELECT * FROM product WHERE id = ?", [productId]);
    print('product details from get product $productDb');
    final Product product = Product.fromMap(productDb[0]);
    print('title form ${product.title}');
    return product;
  }
}


getCartItem() async {
  final cartList =
      await db.rawQuery("SELECT * FROM cart WHERE userId = ?", [1]);
  for (var cart in cartList) {
    late Cart cartItem;
    await Cart.fromMap(cart).then((value) => cartItem = value);

    Cart.cartItems.add(cartItem);
  }
}
