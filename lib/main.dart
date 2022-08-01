import 'package:flutter/material.dart';
import 'package:my_furniture_app/databaseHandler/db_functions.dart';
import 'package:my_furniture_app/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDb();
  // await addProducts();
  // await addTwoUser();
//   await getAllUsers();
await getAllProducts();
  // print("Created tables");
  // print(await getUser('jish2', '1234'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mr.Couch',
      theme: ThemeData(
        fontFamily: 'gabriela',
        primarySwatch: Colors.amber,
      ),
      home: const Splash(),
    );
  }
}
