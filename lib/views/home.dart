import '../unused/models.dart';
import 'recipepost/new_recipe.dart';
import '../unused/recipe_view.dart';
import 'package:flutter/material.dart';
import './recipepost/recipe_detail.dart';
import '../model/models.dart';
import '../model/recipes.dart';

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

// class _HomePageState extends State<HomePage> {
//   final _fetchData = GlobalKey<FormState>();

//   // RecipeList
//   String user_fullname;
//   String nama_masakan;
//   String deskripsi_masakan;
//   String bahan_masakan;
//   String cara_masakan;

//   // Constructor

//   _HomePageState({
//     required this.user_fullname,
//     required this.nama_masakan,
//     required this.deskripsi_masakan,
//     required this.bahan_masakan,
//     required this.cara_masakan,
//   });

//   String? searchRecipe;

//   final _SearchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _SearchController.addListener(() {
//       setState(() {
//         searchRecipe = _SearchController.text;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _SearchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//       // Search Bar
//       Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Form(
//               key: _fetchData,
//               child: TextFormField(
//                 controller: _SearchController,
//                 decoration: InputDecoration(
//                   hintText: 'Cari Resep',
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       _SearchController.clear();
//                     },
//                     icon: Icon(Icons.clear),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           ListView.builder(itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => DetailScreen(reseps: [index])));
//           },
//           child: Card(
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                             image: NetworkImage('https://i.imgur.com/lKWxFxb.png'),
//                             fit: BoxFit.cover)),
//                   )
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                             color: Colors.blueAccent)),
//                     Text('Oleh : ${}'),
//                     ClipOval(
//                       child: Material(
//                         color: Colors.blue, // button color
//                         child: InkWell(
//                           splashColor: Colors.red, // inkwell color
//                           child: SizedBox(
//                               width: 30,
//                               height: 30,
//                               child: Icon(Icons.favorite)),
//                           onTap: () {
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       }),
//         ],
//       ),
//     );
//   }
// }

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
                        Text('Oleh : @penulis_masakan'),
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
