import 'package:autism/controller/user_controller.dart';
import 'package:autism/view/screens/home/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:autism/view/screens/home/components/my_home_page.dart';
import 'package:autism/view/screens/user_login/login_new.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _showPassword = false;

  Future<void> _googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        print('User signed in with Google');
        print('Email: ${googleUser.email}');
        print('Display Name: ${googleUser.displayName}');
        print('Profile Picture URL: ${googleUser.photoUrl}');
        // User is signed in, register the user with your app
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      // Handle the Google Sign-In error
    }
  }

  Future<void> _register() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      // Store user data in Firestore
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.add({
        'username': _usernameController.text.trim(),
        'email': _emailController.text.trim(),
      });

      userCredential.user!.updateDisplayName(_usernameController.text.trim());

      // Show success message and navigate back to main screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You have registered successfully!'),
          duration: Duration(seconds: 3),
        ),
      );
      // Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Password must be more than or equal to 6 characters'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email is already registered to an account.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Something went wrong.'),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(144, 94, 150, 1),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Consumer<LoginController>(
            builder: (context, loginController, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                                'asset/image/sub_categories/animals/cat.png'),
                            radius: 30,
                          ),
                          const SizedBox(height: 30.0),
                          const Text(
                            "Hello! Register to get started",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              hintText: "Username",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Confirm Password",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _register();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(144, 94, 150, 1),
                                padding: const EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                "SIGNUP",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an Account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 05),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                                child: const Text("Login!",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                        ]))),
          );
        }));
  }
}
