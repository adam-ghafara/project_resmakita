import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import '../unused/models.dart';

Future connector() async {
List<RecipeData> recipes = [];

var Connection = PostgreSQLConnection(
    'localhost',
    5432,
    'super4reci',
    username: 'admin',
    password: '12345'
);

try {
  await Connection.open();
  print('Database connected');
} catch (e) {
  print('Database connection failed');
  print(e);
}

// Future<void> getRecipe() async {
//     final response =
//     await Connection.query('SELECT * FROM resmaresep JOIN users ON resmaresep.penulis_masakan = users.user_fullname');
//     if (response != null) {
//       for (var i = 0; i < response.length; i++) {
//         recipes.add(RecipeData.fromJSON(response[i]));
//       }
//   }
// }
}


// 
// Future<List<UserControl>> getUsers() async {
//   List<List<dynamic>> results = await Connection.query('SELECT * FROM users');
//   List<UserControl> users = results.map((item) => UserControl.fromJSON(item)).toList();
//   return users;
// }