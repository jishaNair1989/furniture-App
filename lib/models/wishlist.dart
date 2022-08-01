import 'package:my_furniture_app/models/product.dart';

class Wishlist {
  final int id;
  final Product product;
  Wishlist({
    required this.id,
    required this.product,
  });
}

// List<Wishlist> demoWishlist = [
//   Wishlist(product: product[1], id: 1),
//   Wishlist(product: product[2], id: 2),
//   Wishlist(product: product[3], id: 3),
// ];
