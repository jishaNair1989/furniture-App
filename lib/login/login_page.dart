import 'package:flutter/material.dart';
import 'package:my_furniture_app/databaseHandler/db_functions.dart';

import 'package:my_furniture_app/home_page.dart';
import 'package:my_furniture_app/login/helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userId = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  bool isDatamatched = true;
  final formKey = GlobalKey<FormState>();

  login() async {
    String uName = userName.text;
    String uPassword = password.text;

    final user = await getUser(uName, uPassword);
    if (user.isEmpty || user == null) {
      alertDialog(context, "Invalid login or password");
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => Body())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              height: 50,
              image: AssetImage('assets/couch.png'),
              alignment: Alignment.topLeft,
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gabriela',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: userName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'username',
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.yellow),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fillColor: Colors.amber[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.yellow),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) => value?.length == 0
                              ? 'Please enter username'
                              : null,
                        ),
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: password,
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'password',
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.yellow),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fillColor: Colors.amber[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.yellow),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: true,
                              onChanged: (t) {},
                              activeColor: Colors.grey),
                          const Text(
                            'Remember Me',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Divider(color: Colors.black),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            {
                              formKey.currentState?.validate();
                              login();
                            }
                          },
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.amber),
                          ),
                          child: const Text(
                            'Login',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 7), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Not registered?'),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: Colors.amber,
                            ),
                            child: const Text('SignUp'),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          )
        ],
      ) /* add child content here */,
    ),
    );
  }
}
