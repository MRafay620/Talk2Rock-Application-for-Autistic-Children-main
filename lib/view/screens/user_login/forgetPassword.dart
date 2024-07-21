import 'package:autism/view/screens/user_login/login_new.dart';
import 'package:autism/view/screens/user_login/otpVerify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  // Function to reset password to the entered email address using Firebase Authentication
  Future<void> _resetPassword(BuildContext context) async {
    String email = _emailController.text;
    try {
      // Send OTP to the entered email address using Firebase Authentication
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Navigate to OTP verification screen after sending OTP
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerificationScreen(email: email)),
      );
    } catch (error) {
      // Handle any errors that occur during OTP sending, e.g., invalid email address
      print('Failed to send Email: $error');
      // Show error message to user or handle error as per your app's requirements
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(144, 94, 150,1),
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
              Color.fromRGBO(144, 94, 150,1),
              Color.fromRGBO(255, 143, 177,1),
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
                "Don't worry! It happens.",
                style: TextStyle(fontSize: 24.0,
                    color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                'Please enter the email address linked with your account.',
                style: TextStyle(fontSize: 16.0,color: Colors.white),
              ),
              SizedBox(height: 32.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 40,
                width: 600,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(144, 94, 150,1),),
                  onPressed: () {
                    _resetPassword(context);
                  },
                  child: Text('Send Code',style: TextStyle(color: Colors.white),),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Remember Password? ", style: TextStyle(color: Colors.white),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Login!",style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
