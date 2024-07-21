import 'package:flutter/material.dart';
import 'package:autism/view/screens/user_login/login_new.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;

  OtpVerificationScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(144, 94, 150, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              Text(
                "Password Reset",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                'A password reset email has been sent to your email address:',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                'Enter your email to the field below and you can move to the Login Page',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                email,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 40,
                width: 600,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(144, 94, 150, 1),
                  ),
                  onPressed: () {
                    // Add logic to verify OTP and navigate to login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Move to Login Page',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
