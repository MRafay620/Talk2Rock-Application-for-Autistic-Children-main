import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  @override
  _CreateNewPasswordScreenState createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _newPassword = '';
  String _confirmPassword = '';

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement password reset logic
      print('Resetting password to $_newPassword');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateNewPasswordScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(144, 94, 150,1),
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0,),
                Text("Create New Password!", style: TextStyle(fontSize: 30, color: Colors.white),),
                SizedBox(height: 16.0,),
                Text('Your new password must be unique from the previously used', style: TextStyle(color: Colors.white),),
                SizedBox(height: 16.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value == _confirmPassword) {
                      return 'New password must be different from the previous one';
                    }
                    return null;
                  },
                  onChanged: (value) => _newPassword = value,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    if (value != _newPassword) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onChanged: (value) => _confirmPassword = value,
                ),
                SizedBox(height: 32.0),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 600,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(144, 94, 150, 1)),
                      onPressed: _resetPassword,
                      child: Text('Reset Password', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
