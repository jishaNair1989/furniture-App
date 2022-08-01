import 'package:flutter/material.dart';
import 'package:my_furniture_app/databaseHandler/db_functions.dart';
import 'package:my_furniture_app/login/login_page.dart';
import 'package:my_furniture_app/search_page.dart';
import 'package:my_furniture_app/widget_itemcard.dart';
import 'package:my_furniture_app/widget_category_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final a = getAllProducts();
  final  productList = productListNotifier.value;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.amber,
            ),
            Positioned(
              bottom: 50.0,
              right: 100.0,
              child: Container(
                height: 400.0,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  color: Colors.amberAccent,
                ),
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 150.0,
              child: Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
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
                Row(
                  children: [
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 5.0,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/avatar.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120.0,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: const Icon(Icons.logout),
                          color: Colors.white,
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (ctx1) => const LoginPage()),
                                (route) => false);
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Hello Jisha',
                    style: TextStyle(
                      letterSpacing: .5,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gabriela',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: Text(
                    'What do you want to buy?',
                    style: TextStyle(
                      fontFamily: 'gabriela',
                      letterSpacing: .5,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SearchPage();
                        }),
                      );
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(15.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.amber,
                            size: 30.0,
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 5.0,
                            top: 15.0,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'gabriela',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),

        Row(
          children: [
            category('assets/sofa.jpg', 'sofa'),
            category('assets/dressing.jpg', 'dressing'),
            category('assets/desk.png', 'desk'),
            category('assets/wardrobe.jpg', 'wardrobe'),
          ],
        ),

        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return itemCard(productListNotifier.value[index], true, context);
          },
          itemCount: 4,
        )),

        // itemCard(productList[1], true, context),
        // itemCard(productList[2], false, context),
        // itemCard(productList[3], true, context),
        // itemCard(productList[4], false, context),

        // itemCard('Sofa', 'assets/a1.jpg', false, context),
        // itemCard('Sofa', 'assets/a2.jpg', true, context),
        // itemCard('Sofa', 'assets/a3.jpg', true, context),
        // itemCard('Sofa', 'assets/a4.webp', false, context),
      ],
    );
  }

}
