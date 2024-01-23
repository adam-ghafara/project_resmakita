import 'dart:convert';

import 'package:flutter/material.dart';
import '../accounting/login.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;
import 'recipe_detail.dart';

class DrawerBar extends StatefulWidget {
  const DrawerBar({super.key});
  @override
  _DrawerBarState createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('ResmaKita')
          ],
        ),
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: UserInformation(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap:() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Tambah Resep Masakan'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewRecipePage()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorit'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
            ),
          ],
        ),
      ),
      body: Center(
        child: NewRecipePage(),
    ),
    );
  }
}

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Show User Information
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
          ),
          SizedBox(height: 5),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }, child: Text('Login')),
          ColoredBox(color: Colors.lightBlue),
        ],
      ),
    );
  }
}

class NewRecipePage extends StatefulWidget {
  const NewRecipePage({super.key});

  @override
  _NewRecipePageState createState() => _NewRecipePageState();
}

class _NewRecipePageState extends State<NewRecipePage> {
  final TextEditingController namamasakanController = TextEditingController();
  // Get user_fullname from login.dart
  final TextEditingController deskripsimasakanController = TextEditingController();
  final TextEditingController bahanmasakanController = TextEditingController();
  final TextEditingController caramasakanController = TextEditingController();

  Future<void> NewRecipe() async {
    final String namamasakan = namamasakanController.text;
    final String penulis_masakan = user_fullname;
    final String deskripsimasakan = deskripsimasakanController.text;
    final String bahanmasakan = bahanmasakanController.text;
    final String caramasakan = caramasakanController.text;

    final response = await http.post(
      Uri.parse('http://localhost/resmakita/reseps'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nama_masakan': namamasakan,
        'penulis_masakan': penulis_masakan,
        'deskripsi_masakan': deskripsimasakan,
        'bahan_masakan': bahanmasakan,
        'cara_masakan': caramasakan,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Resep'),
      ),
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama Masakan
          Text('Nama Masakan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: namamasakanController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Deskripsi Masakan
          Text('Deskripsi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: deskripsimasakanController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 80),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Bahan Masakan
          Text('Bahan-Bahan untuk memasak masakan ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: bahanmasakanController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 80),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Cara Masakan
          Text('Tata Cara Masak', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          TextField(
            controller: caramasakanController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 150),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14)
          ),
          SizedBox(height: 20),
          // Gambar Masakan
          // Button
          ElevatedButton(
            onPressed: () async {
              // Verify that the fields should not be empty, and then send the data to the database, and return to main page
              if (namamasakanController.text.isNotEmpty && deskripsimasakanController.text.isNotEmpty && bahanmasakanController.text.isNotEmpty && caramasakanController.text.isNotEmpty) {
                NewRecipe();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Resep gagal ditambahkan'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }, child: Text('Tambah Resep'),
          ),
        ],
      ),
      )
      ),
      );
  }
}

// class _NewRecipePageState extends State<NewRecipePage> {
//   // formKey
//   final _NewRecipeformKey = GlobalKey<FormState>();
  
//   // TextEditingController
//   final user_fullnameController = TextEditingController();
//   final nama_masakanController = TextEditingController();
//   final deskripsi_masakanController = TextEditingController();
//   final bahan_masakanController = TextEditingController();
//   final cara_masakanController = TextEditingController();

//   // Fill Verification
//   String _userFullnameValue = '';
//   String _userFullnameLastValue() {
//     return _userFullnameValue = ((user_fullnameController.text).isNotEmpty && 
//         (user_fullnameController.text).length > 0) ? user_fullnameController.text : '';
//   }

//   String _namaMasakanValue = '';
//   String _namaMasakanLastValue() {
//     return _namaMasakanValue = ((nama_masakanController.text).isNotEmpty && 
//         (nama_masakanController.text).length > 0) ? nama_masakanController.text : '';
//   }

//   String _deskripsiMasakanValue = '';
//   String _deskripsiMasakanLastValue() {
//     return _deskripsiMasakanValue = ((deskripsi_masakanController.text).isNotEmpty && 
//         (deskripsi_masakanController.text).length > 0) ? deskripsi_masakanController.text : '';
//   }

//   String _bahanMasakanValue = '';
//   String _bahanMasakanLastValue() {
//     return _bahanMasakanValue = ((bahan_masakanController.text).isNotEmpty && 
//         (bahan_masakanController.text).length > 0) ? bahan_masakanController.text : '';
//   }

//   String _caraMasakanValue = '';
//   String _caraMasakanLastValue() {
//     return _caraMasakanValue = ((cara_masakanController.text).isNotEmpty && 
//         (cara_masakanController.text).length > 0) ? cara_masakanController.text : '';
//   }

//   // Init State

//   @override
//   void initState() {
//     super.initState();
//     nama_masakanController.addListener(_namaMasakanLastValue);
//     deskripsi_masakanController.addListener(_deskripsiMasakanLastValue);
//     bahan_masakanController.addListener(_bahanMasakanLastValue);
//     cara_masakanController.addListener(_caraMasakanLastValue);
//   }

//   // Dispose

//   @override
//   void dispose() {
//     nama_masakanController.dispose();
//     deskripsi_masakanController.dispose();
//     bahan_masakanController.dispose();
//     cara_masakanController.dispose();
//     super.dispose();
//   }

//   // Build

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tambah Resep'),
//       ),
//       body: Padding(padding: const EdgeInsets.all(20.0),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _NewRecipeformKey,
//           child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Nama Masakan
//             Text('Nama Masakan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//             TextFormField(
//               controller: nama_masakanController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//               style: TextStyle(fontSize: 14),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Nama Masakan tidak boleh kosong';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             // Penulis masakan
//             Text('Penulis', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//             TextFormField(
//               controller: user_fullnameController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//               style: TextStyle(fontSize: 14),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Penulis Masakan tidak boleh kosong';
//                 }
//                 return null;
//               },
//             ),
//             // Deskripsi Masakan
//             Text('Deskripsi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//             TextFormField(
//               controller: deskripsi_masakanController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 80),
//                 border: OutlineInputBorder(),
//               ),
//               style: TextStyle(fontSize: 14),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Deskripsi Masakan tidak boleh kosong';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             // Bahan Masakan
//             Text('Bahan-Bahan untuk memasak masakan ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//             TextFormField(
//               controller: bahan_masakanController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 80),
//                 border: OutlineInputBorder(),
//               ),
//               style: TextStyle(fontSize: 14),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Bahan Masakan tidak boleh kosong';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             // Cara Masakan
//             Text('Tata Cara Masak', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//             TextFormField(
//               controller: cara_masakanController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 150),
//                 border: OutlineInputBorder(),
//               ),
//               style: TextStyle(fontSize: 14),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Cara Masakan tidak boleh kosong';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             // Button
//             // ElevatedButton(
//             //   onPressed: () async {
//             //     NewRecipe();
//             //   },
//             //   child: Text('Tambah Resep'),
//             // ),
//           ],
//         ),
//         ),
//       )
//       ),
//       );
// }
  // void NewRecipe() async {
  //   if (_NewRecipeformKey.currentState!.validate()) {
  //     _NewRecipeformKey.currentState!.save();

  //     Models()
  //     .NewRecipePost(_userFullnameValue, _namaMasakanValue, _deskripsiMasakanValue, _bahanMasakanValue, _caraMasakanValue)
  //     .then((value) {
  //       if (value == 'success') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Resep berhasil ditambahkan'),
  //             backgroundColor: Colors.green,
  //           ),
  //         );
  //         Navigator.pop(context);
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Resep gagal ditambahkan'),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //       }
  //     });
  //     }
  // }
}

// class _NewRecipePageState extends State<NewRecipePage> {
//   final TextEditingController nama_masakanController = TextEditingController();
//   final TextEditingController penulis_masakanController = TextEditingController();
//   final TextEditingController gambar_masakanController = TextEditingController();
//   final TextEditingController deskripsi_masakanController = TextEditingController();
//   final TextEditingController bahan_masakanController = TextEditingController();
//   final TextEditingController cara_masakanController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tambah Resep'),
//       ),
//       body: Padding(padding: const EdgeInsets.all(20.0),
//       child: SingleChildScrollView(
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Nama Masakan
//           Text('Nama Masakan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//           TextField(
//             controller: nama_masakanController,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//             style: TextStyle(fontSize: 14)
//           ),
//           SizedBox(height: 20),
//           // Penulis masakan
//           Text('Penulis', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//           TextField(
//             controller: penulis_masakanController,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//             style: TextStyle(fontSize: 14)
//           ),
//           SizedBox(height: 20),
//           // Deskripsi Masakan
//           Text('Deskripsi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//           TextField(
//             controller: deskripsi_masakanController,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 80),
//               border: OutlineInputBorder(),
//             ),
//             style: TextStyle(fontSize: 14)
//           ),
//           SizedBox(height: 20),
//           // Bahan Masakan
//           Text('Bahan-Bahan untuk memasak masakan ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//           TextField(
//             controller: bahan_masakanController,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 80),
//               border: OutlineInputBorder(),
//             ),
//             style: TextStyle(fontSize: 14)
//           ),
//           SizedBox(height: 20),
//           // Cara Masakan
//           Text('Tata Cara Masak', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
//           TextField(
//             controller: cara_masakanController,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 150),
//               border: OutlineInputBorder(),
//             ),
//             style: TextStyle(fontSize: 14)
//           ),
//           SizedBox(height: 20),
//           // Gambar Masakan
//           // Button
//           ElevatedButton(
//             onPressed: () async {
//               PostgreSQLConnection connection = await connector();
//               await connection.query('''
//                 INSERT INTO resep (user_fullname, nama_masakan, deskripsi_masakan, bahan_masakan, cara_masakan, gambar_masakan)
//                 VALUES (@user_fullname, @nama_masakan, @jenis_masakan, @deskripsi_masakan, @bahan_masakan, @cara_masakan, @gambar_masakan)
//               ''', substitutionValues: {
//                 'jenis_masakan': penulis_masakanController.text,
//                 'nama_masakan': nama_masakanController.text,
//                 'deskripsi_masakan': deskripsi_masakanController.text,
//                 'bahan_masakan': bahan_masakanController.text,
//                 'cara_masakan': cara_masakanController.text,
//                 'gambar_masakan': gambar_masakanController.text,
//               });
//               Navigator.pop(context);
//             },
//             child: Text('Tambah Resep'),
//           ),
//         ],
//       ),
//       )
//       ),
//       );
//   }