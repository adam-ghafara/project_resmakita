import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login.dart';
import 'package:passwordfield/passwordfield.dart';

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
        'user_fullname': fullname,
        'user_username': username,
        'user_password': password,
      }),
    );
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
                Text('Isi Data untuk membuat Akun', style: TextStyle(fontSize: 20),),
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
              PasswordField(
                  controller: passwordController,
              ),
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
}