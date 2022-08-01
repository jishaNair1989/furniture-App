import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:my_furniture_app/checkout.dart';
import 'package:my_furniture_app/models/wishlist.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key, required this.wishlist}) : super(key: key);
  final Wishlist wishlist;
  @override
  State<WishlistScreen> createState() => _WishlistState();
}

class _WishlistState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 210.0,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Wishlist',
                              style: TextStyle(
                                letterSpacing: .5,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "{demoWishlist.length} items",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      WishlistCard(),
                      SizedBox(height: 10),
                      WishlistCard(),
                      SizedBox(height: 10),
                      WishlistCard(),
                      SizedBox(height: 10),
                      WishlistCard(),
                      SizedBox(height: 10),
                      WishlistCard(),
                      SizedBox(height: 10),
                      WishlistCard(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 600,),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Total: \$656',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 30,
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
              child: const Text('Go to Check Out'),
            )
          ],
        ),
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 15),
    //   color: Colors.white,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       SizedBox(
    //         height: 100,
    //         width: 100,
    //         child: demoWishlist[0].product.image,
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Text(
    //             'Woody Land',
    //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //           ),
    //           Text(
    //             'Color:Grey',
    //             style: TextStyle(fontSize: 14, color: Colors.grey),
    //           ),
    //           Text(
    //             '3499 INR',
    //             style: TextStyle(fontSize: 16, color: Colors.amberAccent),
    //           ),
    //         ],
    //       ),
    //       const Icon(
    //         Icons.favorite,
    //         color: Colors.red,
    //       ),
    //     ],
    //   ),
    // );
  }
}
