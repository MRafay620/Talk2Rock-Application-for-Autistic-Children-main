import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/app.dart';
import 'package:provider/provider.dart';

class LoginState extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void setLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LoginState loginState = LoginState();
  final ThemeData darkTheme = ThemeData.dark();
  runApp(
    ChangeNotifierProvider<LoginState>(
      create: (context) => LoginState(),
      child: const App(),
    ),
  );
}
