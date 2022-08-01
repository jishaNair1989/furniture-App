import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_furniture_app/models/cart.dart';
import 'package:my_furniture_app/models/product.dart';
import 'package:my_furniture_app/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);
ValueNotifier<List<Product>> productListNotifier = ValueNotifier([]);
ValueNotifier<List<Cart>> cartNotifier = ValueNotifier([]);

const DB_Name = 'login.db';
const String Table_user = 'user';
const int Version = 1;

late Database db;
Future<Database?> get database async {
  if (db != null) {
    return db;
  }
  db = await initDb();
  return null;
}

Future initDb() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, DB_Name);

  db = await openDatabase(path, version: Version, onCreate: _onCreate);

  await addTwoUser();
  await addProducts();
  return db;
}

_onCreate(Database db, int intVersion) async {
  await db.execute(
      'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT, password TEXT)');
  await db.execute(
      'CREATE TABLE product (Id INTEGER PRIMARY KEY AUTOINCREMENT ,title TEXT, description TEXT, price INTEGER,image IMAGE,isFavorite BOOL)');
  await db.execute(
      'CREATE TABLE cart (Id INTEGER PRIMARY KEY AUTOINCREMENT,  userId INTEGER, productId INTEGER UNIQUE, FOREIGN KEY(productId) REFERENCES product(id))');
  await db.execute(
      'CREATE TABLE wishlist (Id INTEGER PRIMARY KEY AUTOINCREMENT, userId INTEGER, productId INTEGER, FOREIGN KEY(productId) REFERENCES product(id))');
}

addToCart(int productId, int userId) async {

  await db.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO cart( userId, productId) VALUES(userId,productId)');
    cartNotifier.notifyListeners();

  });


}

addTwoUser() async {
  await db.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO user( username, password) VALUES("jisha","1234")');

    int id2 = await txn.rawInsert(
        'INSERT INTO user( username, password) VALUES("jishaP","1234")');

    userListNotifier.notifyListeners();
  });
}


getUser(String username, String password) async {
  final user = await db.rawQuery(
      "SELECT * FROM user WHERE username = ? AND password = ?",
      [username, password]);
  return user;
}

addProducts() async {
  await db.transaction((txn) async {
    // List tempList=[];
    int id1 = await txn.rawInsert(
        'INSERT INTO product( title,description,price,image) VALUES("Poppy Class tub Chair","Sabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake","456","https://images.unsplash.com/photo-1592078615290-033ee584e267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")');
    // print('inserted1: $id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO product( title,description,price,image) VALUES("Class leather Arm Chair","Wabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake","565","https://media.istockphoto.com/photos/front-view-of-gray-color-armchair-for-legs-modern-designer-armchair-picture-id1346007483?k=20&m=1346007483&s=170667a&w=0&h=bmH3qCfFGzB7wARDOs3KXLb9V2M9PCo1svGdobESgUs=")');
    // print('inserted2: $id2');
    int id3 = await txn.rawInsert(
        'INSERT INTO product( title,description,price,image) VALUES("Classy leather Arm Chair","Fabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake","864","https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60")');
    int id4 = await txn.rawInsert(
        'INSERT INTO product( title,description,price,image) VALUES("Wide leather Arm Chair","Sabine Darcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake","965","https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")');

    //  productListNotifier.value.addAll(tempList[0]);
    productListNotifier.notifyListeners();
  });
}

getAllProducts() async {
  List values = await db.rawQuery("SELECT * FROM product");
  productListNotifier.value.clear();
  for (var map in values) {
    final product = Product.fromMap(map);
    productListNotifier.value.add(product);
    productListNotifier.notifyListeners();
  }
}



// Future<int?> getCount() async {
//   Database? db = await database;
//   List<Map<String, Object?>>? x = await db?.rawQuery('SELECT COUNT (*) from product');
//   int? result = Sqflite.firstIntValue(x!);
//   return result;
// }


Future<int?> deleteCartItem(int id) async {
  var db = await database;
  int? result = await db?.rawDelete('DELETE FROM cart WHERE Id = $id');
  return result;
}
