import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 300.0,
                  width: double.infinity,
                  color: Colors.amber,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 45.0, top: 35),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        letterSpacing: .5,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'gabriela',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 650,
                    width: 350,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 10,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 7), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(
                                  //   height: 10,
                                  // ),
                                  const Text(
                                    'Full Name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'enter fullname',
                                        filled: true,
                                        fillColor: Colors.amber[100],
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.yellow),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Address',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'enter address',
                                        filled: true,
                                        fillColor: Colors.amber[100],
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.yellow),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'enter email',
                                        filled: true,
                                        fillColor: Colors.amber[100],
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.yellow),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Phone',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'enter phone',
                                        filled: true,
                                        fillColor: Colors.amber[100],
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: Colors.yellow),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('SAVE'),
                                    ),
                                  ),
                                ]),
                          ),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Payment options',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Card(
                                color: Colors.amberAccent,
                                elevation: 3,
                                child: Center(
                                  child: Text('Credit Card'),
                                ),
                              ),
                              Card(
                                color: Colors.amberAccent,
                                elevation: 3,
                                child: Center(
                                  child: Text('Debit Card'),
                                ),
                              ),
                              Card(
                                color: Colors.amberAccent,
                                elevation: 3,
                                child: Center(
                                  child: Text('Netbanking'),
                                ),
                              ),
                              Card(
                                color: Colors.amberAccent,
                                elevation: 3,
                                child: Center(
                                  child: Text('UPI'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 700,),

          ],
        ),
      ),
    );
  }
}
