import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_furniture_app/cart/cart_screen.dart';
import 'package:my_furniture_app/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product productModel;

  const ProductDetailsScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  @override
  ProductDetailsScreenState createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // final description =
  //     'The Mia armchair understands your subtle need for beautiful home decor. Upholstered in highly functional yet beautiful linen fabric, this stunning piece can be placed almost anywhere in your home. It features sturdy wooden frame and comfortable pocket coil construction for decadent comfort. Available in many colors that will complement your home\'s specific decor.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartScreen(
                    // cartImage: product[0].image,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Icon(Icons.add_shopping_cart), Text('Add')],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 1, child: _buildProductImage()),
          _buildAbout(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        'Product',
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.w600,
          fontFamily: 'gabriela',
        ),
      ),
      actions: const <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildProductImage() {
    return ListView(
      children: [
        CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/chair/1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //2nd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/chair/2.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //3rd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/chair/3.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //4th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/chair/4.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            //5th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/chair/1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ],
    );
  }

  Widget _buildAbout() {
    return Expanded(
      flex: 3,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.productModel.title,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'gabriela',
                  ),
                ),
                Text(
                  widget.productModel.description,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'gabriela',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              widget.productModel.description,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'gabriela',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
