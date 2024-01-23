import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:postgres/postgres.dart';
import 'login.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return NewAccountPage();
  }
}

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> NewAccount() async {
    final String fullname = fullnameController.text;
    final String username = usernameController.text;
    final String password = passwordController.text;

    final Response response = await post(
      Uri.parse('http://localhost/resmakita/users.php'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'fullname': fullname,
        'username': username,
        'password': password,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Akun Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 170,
                    ),
                    Text(
                      "ResmaKita",
                      style: TextStyle(fontSize: 45),
                    )
                  ]),
                ),
              ),
              Text('Nama Lengkap',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              // Jenis Masakan
              Text('Username',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              // Deskripsi Masakan
              Text('Password',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                  onPressed: () {
                    // Verify that fields should not be empty and password should be more than 6 characters, then call the register method if the fields are valid, then continue to the login page.
                    if (fullnameController.text.isEmpty ||
                        usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tolong isi semua field.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (passwordController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Password harus lebih dari 6 karakter'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      NewAccount();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Akun Berhasil Dibuat! Silahkan melakukan Login.'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  child: Text('Buat Akun'))
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
}

// class _NewAccountPageState extends State<NewAccountPage> with SingleTickerProviderStateMixin {
//   // Page Controller
//   final _NewAccountFormKey = GlobalKey<FormState>();


//   // Controller
//     final fullnameController = TextEditingController();
//     final usernameController = TextEditingController();
//     final passwordController = TextEditingController();

//   // Get Value Method
//   String fullnameText = '';
//   String _fullnameCollecting() {
//     return fullnameText = ((fullnameController.text).isNotEmpty &&
//             (fullnameController.text).length > 0)
//         ? fullnameController.text
//         : '';
//   }

//   String usernameText = '';
//   String _usernameCollecting() {
//     return usernameText = ((usernameController.text).isNotEmpty &&
//             (usernameController.text).length > 0)
//         ? usernameController.text
//         : '';
//   }

//   String passwordText = '';
//   String _passwordCollecting() {
//     return passwordText = ((passwordController.text).isNotEmpty &&
//             (passwordController.text).length > 0)
//         ? passwordController.text
//         : '';
//   }

//   // Initiate Data

//   @override
//   void initState() {
//     super.initState();
//     fullnameController.addListener(_fullnameCollecting);
//     usernameController.addListener(_usernameCollecting);
//     passwordController.addListener(_passwordCollecting);
//   }

//   // dispose Data
//   @override
//   void dispose() {
//     fullnameController.dispose();
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   // Widget
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Buat Akun Baru'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Column(children: [
//                     Icon(
//                       Icons.restaurant_menu,
//                       size: 170,
//                     ),
//                     Text(
//                       "ResmaKita",
//                       style: TextStyle(fontSize: 45),
//                     )
//                   ]),
//                 ),
//               ),
//               Text('Nama Lengkap',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//               TextField(
//                   controller: fullnameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(fontSize: 14)),
//               SizedBox(height: 20),
//               // Jenis Masakan
//               Text('Username',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//               TextField(
//                   controller: usernameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(fontSize: 14)),
//               SizedBox(height: 20),
//               // Deskripsi Masakan
//               Text('Password',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//               TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(fontSize: 14)),
//               SizedBox(height: 20),
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                   onPressed: () {
//                   },
//                   child: Text('Buat Akun'))
//               ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  // void RegisterMethod(BuildContext context) {
  //   if (_NewAccountFormKey.currentState!.validate()) {
  //     _NewAccountFormKey.currentState!.save();

  //     Models() 
  //     .NewAccountReg(fullnameText, usernameText, passwordText)
  //     .then((value) {
  //       if (value == 'success') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Akun Berhasil Dibuat'),
  //             backgroundColor: Colors.green,
  //           ),
  //         );
  //         Navigator.pop(context);
  //       } else if (value == 'alr') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Akun Sudah Ada'),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //       } else if (value == 'failed') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Akun Gagal Dibuat'),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Terjadi Kesalahan'),
  //             backgroundColor: Colors.red,
  //           ),
  //         );
  //       }
  //     });
  //   }
  // }
}

// class _NewAccountPageState extends State<NewAccountPage> {
//   final TextEditingController fullnameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Buat Akun Baru'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Column(children: [
//                     Icon(
//                       Icons.restaurant_menu,
//                       size: 170,
//                     ),
//                     Text(
//                       "ResmaKita",
//                       style: TextStyle(fontSize: 45),
//                     )
//                   ]),
//                 ),
//               ),
//               Text('Nama Lengkap',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//               TextField(
//                   controller: fullnameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(fontSize: 14)),
//               SizedBox(height: 20),
//               // Jenis Masakan
//               Text('Username',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//               TextField(
//                   controller: usernameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(fontSize: 14)),
//               SizedBox(height: 20),
//               // Deskripsi Masakan
//               Text('Password',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//               TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   style: TextStyle(fontSize: 14)),
//               SizedBox(height: 20),
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                   onPressed: () {
//                     connector().then((conn) {
//                       conn.query(
//                           'INSERT INTO users (user_fullname, r_username, r_password) VALUES (@fullname, @username, @password)',
//                           substitutionValues: {
//                             'user_fullname': fullnameController.text,
//                             'r_username': usernameController.text,
//                             'r_password': passwordController.text
//                           });
//                       Navigator.pop(context);
//                     });
//                   },
//                   child: Text('Buat Akun'))
//               ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }