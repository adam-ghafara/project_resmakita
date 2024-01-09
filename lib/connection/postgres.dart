import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

Future connector() async {
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

// initDatabaseConnection() async {
//   Connection.open().then((value) {
//     print('Database connected');
//   }).catchError((error) {
//     print('Database connection failed');
//     print(error);
//   });
//   List<Map<String, dynamic>> result = await Connection.mappedResultsQuery("SELECT * FROM resmaresep");
// }
}
