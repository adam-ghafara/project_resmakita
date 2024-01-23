import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './new_account.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyApp(),
        '/newaccount': (context) => NewAccountPage(),
      },
      home: Scaffold(
      appBar: AppBar(title: Text('Login ke Akunmu')),
        backgroundColor: Colors.blue,
        body: LoginPage(),
    )
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> LoggingIn() async {
    final String user_username = usernameController.text;
    final String user_password = passwordController.text;

    final response = await http.post(
    Uri.parse('http://localhost/resmakita/users.php'),
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: jsonEncode({
      'user_username': user_username,
      'user_password': user_password,
    })
    );

    if (response.statusCode == 200) {
      print('Login Success');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } else {
      print('Login Failed');
      PopupMenuButton(
        itemBuilder: (BuildContext bc) => [
          PopupMenuItem(child: Text("Username atau Password salah, Silahkan coba lagi."), value: "/login"),
        ],
        onSelected: (route) {
          Navigator.pushNamed(context, route);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Align(alignment: Alignment.center,
                  child: Column(children: [
                    Icon(Icons.restaurant_menu, size: 170,),
                    Text("ResmaKita", style: TextStyle(fontSize: 45),)
                  ]),),
                ),
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
                // Jenis Masakan
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
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(onPressed: () {
                    LoggingIn();
                  }, child: Text('Login', style: TextStyle(fontSize: 17),)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewAccountPage()),
                      );
                    },
                    child: Text('Buat Akun Baru'),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


// class _LoginPageState extends State<LoginPage> {
//   final _loginFormKey = GlobalKey<FormState>();
//   // Controller for Field
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   // Controller must have entered value
//   String userValue = '';
//   String _userValueContain() {
//     return userValue = ((usernameController.text).isNotEmpty &&
//             (usernameController.text).length > 0
//             ? usernameController.text
//             : '');
//   }

//   String passValue = '';
//   String _passValueContain() {
//     return passValue = ((passwordController.text).isNotEmpty &&
//             (passwordController.text).length > 0
//             ? passwordController.text
//             : '');
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     usernameController.addListener(() { _userValueContain(); });
//     passwordController.addListener(() { _passValueContain(); });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Form(
//           key: _loginFormKey,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     child: Align(alignment: Alignment.center,
//                     child: Column(children: [
//                       Icon(Icons.restaurant_menu, size: 170,),
//                       Text("ResmaKita", style: TextStyle(fontSize: 45),)
//                     ]),),
//                   ),
//                   Text('Username',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   TextFormField(
//                       controller: usernameController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                       style: TextStyle(fontSize: 14),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Username tidak boleh kosong';
//                         }
//                         return null;
//                       }),
//                   SizedBox(height: 20),
//                   // Jenis Masakan
//                   Text('Password',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   TextFormField(
//                       controller: passwordController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                       style: TextStyle(fontSize: 14),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Password tidak boleh kosong';
//                         }
//                         return null;
//                       }),
//                   SizedBox(height: 20),
//                   Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(onPressed: () {
//                     }, child: Text('Login', style: TextStyle(fontSize: 17),)),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/newaccount');
//                       },
//                       child: Text('Buat Akun Baru'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//     );
//   }
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login ke Akunmu')),
//         body: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               child: Align(alignment: Alignment.center,
//               child: Column(children: [
//                 Icon(Icons.restaurant_menu, size: 170,),
//                 Text("ResmaKita", style: TextStyle(fontSize: 45),)
//               ]),),
//             ),
//             Text('Username',
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black)),
//             TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//                 style: TextStyle(fontSize: 14)),
//             SizedBox(height: 20),
//             // Jenis Masakan
//             Text('Password',
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black)),
//             TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//                 style: TextStyle(fontSize: 14)),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(onPressed: (
//               ) {
//                 // Connecting to Database
//                 connector().then((conn) {
//                   print('Connected to Database');
//                   // Login
//                   conn.query('SELECT * FROM users WHERE username = @username AND password = @password', substitutionValues: {
//                     'username': usernameController.text,
//                     'password': passwordController.text
//                   }).toList().then((value) {
//                     if (value.length > 0) {
//                       print('Login Success');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => MyApp()),
//                       );
//                     } else {
//                       print('Login Failed');
//                       PopupMenuButton(
//                         itemBuilder: (BuildContext bc) => [
//                           PopupMenuItem(child: Text("Username atau Password salah, Silahkan coba lagi."), value: "/login"),
//                         ],
//                         onSelected: (route) {
//                           Navigator.pushNamed(context, route);
//                         },
//                       );
//                     }
//                   });
//                 });
//             }, child: Text('Login', style: TextStyle(fontSize: 17),)),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => NewAccountPage()),
//                   );
//                 },
//                 child: Text('Buat Akun Baru'),
//               ),
//             ),
//           ],
//         ),
//       ),
//         ),
//     );
//   }
// }