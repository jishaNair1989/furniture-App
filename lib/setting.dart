import 'package:flutter/material.dart';
import 'package:my_furniture_app/login/login_page.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: 150,
              color: Colors.amber,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 45.0, right: 20),
                    child: Icon(
                      Icons.settings,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75.0, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.account_circle,
                    size: 44,
                    color: Colors.amber,
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 28),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 35,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Icon(
                    Icons.toggle_off,
                    size: 40,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Reset App',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Icon(
                    Icons.refresh,
                    size: 40,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (ctx1) => const LoginPage()),
                          (route) => false);
                },
                child: const Text('Logout',style: TextStyle(fontSize: 24),),
                        ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:Container(
          height: 100,
          color: Colors.amber.withOpacity(.4),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(

              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.copyright_rounded),
                      Text('2022 Mr.Couch'),
                    ],
                  ),
                ),
                const Text('Version 1.1.0'),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
