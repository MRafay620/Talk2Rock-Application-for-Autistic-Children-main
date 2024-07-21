import 'dart:async';
import 'package:autism/view/screens/home/components/my_home_page.dart';
import 'package:autism/view/screens/home/homeScreen.dart';
import 'package:autism/view/screens/user_login/login_new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkAuth() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => MyHomePage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(144, 94, 150, 1),
              Color.fromRGBO(255, 143, 177, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'asset/image/sub_categories/animals/butterfly.png', // Replace this with your own logo image
                height: 200.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to Talk2Rock',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Set the text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk2Rock'),
      ),
      body: Center(
        child: Text('Welcome to Talk2Rock!'),
      ),
    );
  }
}
