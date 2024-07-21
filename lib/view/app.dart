import 'package:autism/controller/user_controller.dart';
import 'package:autism/view/screens/home/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your LoginController provider here
        ChangeNotifierProvider(create: (_) => LoginController()),
      ],
      child: MaterialApp(
        title: 'Autism Application',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
