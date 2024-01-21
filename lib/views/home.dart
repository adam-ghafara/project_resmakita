import '../unused/models.dart';
import 'recipepost/new_recipe.dart';
import '../unused/recipe_view.dart';
import 'package:flutter/material.dart';
import '../unused/resep_card.dart';
import '../model/recipes.dart';
import './recipepost/recipe_detail.dart';

class Page extends StatelessWidget {
  final int recipe_id;

  const Page({required this.recipe_id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
      '/': (context) => HomePage(),
      '/new_recipe': (context) => NewRecipePage(),
      // '/view_recipe/$recipe_id': (context) => RecipeView(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      body: ListView.builder(
          itemCount: dataResep.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(reseps: dataResep[index])));
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
                        Text(dataResep[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.blueAccent)),
                        Text('Oleh : ${dataResep[index].writer}'),
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
          }),
    );
  }
}

// ResepCard(
//             nama_masakan: 'Kue Marmer',
//             penulis_masakan: 'Fadilah',
//             jenis_masakan: 'Kue',
//             gambar_masakan: "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/03/17/Resep-Bolu-Marmer-Jadul-2067379807.jpg")

// class ReturnByteaImage {
//   // Get Bytea from Database and convert to image
//   Future<Image> tinypng() async {
//     // Get Bytea from Database
//     var bytea = await connector();
//     // Convert Bytea to Image
//     var image = Image.memory(bytea);
//     return image;
//   }
// }

      // ResepCard(
      //   nama_masakan: 'Kue Marmer',
      //   jenis_masakan: 'Kue',
      //   gambar_masakan: "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/03/17/Resep-Bolu-Marmer-Jadul-2067379807.jpg"),

          //         floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //   Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewRecipePage()));
          //   },
          //   child: Icon(Icons.add),
          // backgroundColor: Colors.blueGrey[900],
