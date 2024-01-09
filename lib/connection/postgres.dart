import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class RecipeData {
  final String nama_masakan;
  final String jenis_masakan;
  final String deskripsi_masakan;
  final String bahan_masakan;
  final String cara_masakan;
  final String gambar_masakan;

  RecipeData({
    required this.nama_masakan,
    required this.jenis_masakan,
    required this.deskripsi_masakan,
    required this.bahan_masakan,
    required this.cara_masakan,
    required this.gambar_masakan,
  });

  factory RecipeData.fromJSON(dynamic json) {
    return RecipeData(
      nama_masakan: json['nama_masakan'],
      jenis_masakan: json['jenis_masakan'],
      deskripsi_masakan: json['deskripsi_masakan'],
      bahan_masakan: json['bahan_masakan'],
      cara_masakan: json['cara_masakan'],
      gambar_masakan: json['gambar_masakan'],
    );
  }
}

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

Future<List<RecipeData>> getRecipes() async {
  List<List<dynamic>> results = await Connection.query('SELECT * FROM resmaresep');
  recipes = results.map((item) => RecipeData.fromJSON(item)).toList();
  return recipes;
}
}

