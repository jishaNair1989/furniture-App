import 'package:my_furniture_app/login/login_page.dart';
import 'package:my_furniture_app/models/wishlist.dart';
import 'package:my_furniture_app/setting.dart';
import 'package:flutter/material.dart';
import 'package:my_furniture_app/widget_profile_card_details.dart';
import 'package:my_furniture_app/wishlist_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 250.0,
                width: double.infinity,
                color: Colors.amber,
              ),
              Positioned(
                bottom: 250.0,
                right: 100.0,
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              Positioned(
                bottom: 300.0,
                left: 150.0,
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.amberAccent.withOpacity(.5),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(37),
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3.0,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/avatar.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jisha',
                                style: TextStyle(
                                  fontFamily: 'gabriela',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '232******55756',
                                style: TextStyle(
                                  fontFamily: 'gabriela',
                                  fontSize: 15.0,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (ctx1) => const LoginPage()),
                                    (route) => false);
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              iconSize: 20,
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SettingScreen();
                                    },
                                  ),
                                );
                              },
                              color: Colors.white,
                              iconSize: 20.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.folder_shared),
                            color: Colors.white,
                            iconSize: 40.0,
                          ),
                          const Text(
                            'Favorites',
                            style: TextStyle(
                              fontFamily: 'gabriela',
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.account_balance_wallet),
                            color: Colors.white,
                            iconSize: 40.0,
                          ),
                          const Text(
                            'Wallet',
                            style: TextStyle(
                              fontFamily: 'gabriela',
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.print),
                            color: Colors.white,
                            iconSize: 40.0,
                          ),
                          const Text(
                            'Footprint',
                            style: TextStyle(
                              fontFamily: 'gabriela',
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.laptop),
                            color: Colors.white,
                            iconSize: 40.0,
                          ),
                          const Text(
                            'Coupon',
                            style: TextStyle(
                              fontFamily: 'gabriela',
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cardDetails('Pending payment', 'assets/a1.jpg', '3'),
                          cardDetails('To be shipped', 'assets/a2.jpg', '5'),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cardDetails('To be received', 'assets/a3.jpg', '6'),
                          cardDetails('Pending payment', 'assets/a4.webp', '2'),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
              child: listItem(
                  'Wishlist', Colors.red, Icons.favorite_border, context),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return WishlistScreen(
                //         wishlist: demoWishlist[0],
                //       );
                //     },
                //   ),
                // );
              }),
          listItem('Saved Cards', Colors.green, Icons.credit_card, context),
          listItem(
              'Saved Address', Colors.blue, Icons.favorite_border, context),
        ],
      ),
    );
  }
}

Widget listItem(
    String title, Color buttonColor, iconButton, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: buttonColor.withOpacity(0.3),
          ),
          child: Icon(
            iconButton,
            color: buttonColor,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
