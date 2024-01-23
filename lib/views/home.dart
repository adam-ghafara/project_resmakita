import 'dart:ffi';

import 'recipepost/new_recipe.dart';
import 'package:flutter/material.dart';
import './recipepost/recipe_detail.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Page extends StatelessWidget {
  final int id_masakan;

  const Page({required this.id_masakan});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/detail?id_masakan=${id_masakan}': (context) => DetailScreen(id_masakan: id_masakan),
        '/new': (context) => NewRecipePage(),
      },
      home: HomePage(),
    );
  }
}

class recipe {
  final int id_masakan;
  final String nama_masakan;
  final String penulis_masakan;

  recipe({
    required this.id_masakan,
    required this.nama_masakan,
    required this.penulis_masakan,
  });

  factory recipe.fromJSON(dynamic json) {
    return recipe(
      id_masakan: json['id_masakan'],
      nama_masakan: json['nama_masakan'],
      penulis_masakan: json['penulis_masakan'],
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<recipe> _recipes = [];

  Future<void> fetchData() async {
    final response =
    await http.get(Uri.parse('http://localhost/resmakita/reseps'));
    
    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body);
        
      });
    } 
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep Masakan'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewRecipePage()));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 
              '/detail?id_masakan=${_recipes[index].id_masakan}',
              );
            },
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage('https://i.imgur.com/lKWxFxb.png'),
                              fit: BoxFit.cover)),
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_recipes[index].nama_masakan,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.blueAccent)),
                      Text('Oleh : ${_recipes[index].penulis_masakan}'),
                      ClipOval(
                        child: Material(
                          color: Colors.blue, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(Icons.favorite)),
                            onTap: () {
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}