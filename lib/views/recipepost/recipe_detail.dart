import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id_masakan;

  const DetailScreen({Key? key, required this.id_masakan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/detail',
      routes: {
        '/detail':(context) => DetailScreen(id_masakan: id_masakan),
      },
    );
  }
}

class resep {
  final String nama_masakan;
  final String penulis_masakan;
  final String deskripsi_masakan;
  final String bahan_masakan;
  final String cara_masakan;

  resep({
    required this.nama_masakan,
    required this.penulis_masakan,
    required this.deskripsi_masakan,
    required this.bahan_masakan,
    required this.cara_masakan,
  });

  factory resep.fromJSON(dynamic json) {
    return resep(
      nama_masakan: json['nama_masakan'],
      penulis_masakan: json['user_fullname'],
      deskripsi_masakan: json['deskripsi_masakan'],
      bahan_masakan: json['bahan_masakan'],
      cara_masakan: json['cara_masakan'],
    );
  }
}


// class DetailScreen extends StatelessWidget {
//   final resep reseps;

//   const DetailScreen({Key? key, required this.reseps}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(reseps.name),
//       ),
//       body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: Image.network(
//                 'https://i.imgur.com/lKWxFxb.png',
//                 width: 300,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 16,
//           ),
//           Text('${reseps.name}',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 35,
//                 color: Colors.blueAccent),
//           ),
//           Text('Dibuat Oleh: ${reseps.writer}'),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Description : \n' + reseps.deskripsi,
//               maxLines: 15,
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Bahan : \n' + reseps.bahan,
//               maxLines: 15,
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Tutorial : \n' + reseps.tutorial,
//               maxLines: 15,
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//       ),
      
//     );
//   }
// }
