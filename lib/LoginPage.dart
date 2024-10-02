import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: username,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white, // AppBar color
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: _inputFieldsBox(),
          ),
        ),
      ),
    );
  }

  Widget _inputFieldsBox() {
    return Container(
      width: 350,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          SizedBox(height: 15),
          _usernameField(),
          SizedBox(height: 10),
          _passwordField(),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.center,
            child: _loginButton(context),
          ),
        ],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: SizedBox(
        width: 300,
        child: TextFormField(
          onChanged: (value) {
            username = value;
          },
          decoration: InputDecoration(
            hintText: 'Masukkan Username',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orangeAccent),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: SizedBox(
        width: 300,
        child: TextFormField(
          onChanged: (value) {
            password = value;
          },
          obscureText: visible,
          decoration: InputDecoration(
            suffix: IconButton(
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
            ),
            hintText: 'Masukkan Password',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orangeAccent),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'Gasipa' && password == 'latkuis123') {
            _navigateToHome();
            text = "Login berhasil";
            isLoginSuccess = true;
          } else {
            text = "Login gagal";
            isLoginSuccess = false;
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
