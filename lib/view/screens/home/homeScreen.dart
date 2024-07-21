import 'package:autism/constants.dart';
import 'package:autism/view/screens/customize/create_category.dart';
import 'package:autism/view/screens/drawer/about.dart';
import 'package:autism/view/screens/drawer/feedback.dart';
import 'package:autism/view/screens/drawer/help_support.dart';
import 'package:autism/view/screens/drawer/screening_test.dart';
import 'package:autism/view/screens/drawer/settings.dart';
import 'package:autism/view/screens/home/components/my_home_page.dart';
import 'package:autism/view/screens/my_categories/my_categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autism/view/screens/home/components/body.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final views = [
    const Body(),
    const MyCategoriesScreen(),
    SettingsScreen(),
  ];

  List<Map<String, dynamic>> drawer(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return [
      {
        'icon': Icons.home,
        'label': 'Home',
        'onTap': () => scaffoldKey.currentState?.closeDrawer(),
      },
      {
        'icon': Icons.dashboard_customize,
        'label': 'Customize Cateogry',
        'onTap': () {
          scaffoldKey.currentState?.closeDrawer();
          setState(() {
            currentindex = 1;
          });
        },
      },
      {
        'icon': Icons.info,
        'label': 'About',
        'onTap': () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            ),
      },
      {
        'icon': Icons.settings,
        'label': 'Settings',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        ),
      },
      {
        'icon': Icons.help,
        'label': 'Help & Support',
        'onTap': () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpAndSupportScreen()),
            ),
      },
      {
        'icon': Icons.medical_information,
        'label': 'Screening test',
        'onTap': () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AutismScreeningTest()),
            ),
      },
      {
        'icon': Icons.feedback,
        'label': 'Feedbacks',
        'onTap': () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeedbackScreen()),
            ),
      },
      {
        'icon': isLoggedIn ? Icons.logout : Icons.logout,
        'label': isLoggedIn ? 'Logout' : 'Sign In',
        'onTap': () async {
          if (isLoggedIn) {
            final providers = FirebaseAuth.instance.currentUser!.providerData;

            for (final p in providers) {
              if (p.providerId.contains('google')) {
                await GoogleSignIn().signOut();
              }
            }

            await FirebaseAuth.instance.signOut();
          }

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const MyHomePage(),
              ),
            );
          });
        },
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return WillPopScope(
      onWillPop: () async {
        // Close the app when the back button is pressed on the home screen
        bool isHome = ModalRoute.of(context)!.isFirst;
        if (isHome) {
          SystemNavigator.pop();
          return true;
        }
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color.fromRGBO(144, 94, 150, 1),
        floatingActionButton: currentindex == 1 && isLoggedIn
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateCategoryScreen(),
                    ),
                  );
                },
                backgroundColor: const Color.fromRGBO(131, 29, 171, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : null,
        appBar: AppBar(
            centerTitle: true,
            title: const Text('TALK2ROCK',
                style: TextStyle(
                    fontFamily: dfont,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            backgroundColor: const Color.fromRGBO(144, 94, 150, 1)),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 143, 177, 1),
                  Color.fromRGBO(144, 94, 150, 1),
                ],
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(144, 94, 150, 1),
                  ),
                  child: Text(
                    'WELCOME TO TALK2ROCK',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: dfont,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...drawer(context).map(
                  (item) {
                    return ListTile(
                      leading: Icon(
                        item['icon'] as IconData,
                        color: Colors.white,
                      ),
                      title: Text(
                        item['label'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: item['onTap'] as Function()?,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
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
          child: views[currentindex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(234, 196, 202, 1.0),
          currentIndex: currentindex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              //backgroundColor: Color.fromRGBO(144, 94, 150, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets),
              label: 'My Categories',
              //backgroundColor: Color.fromRGBO(144, 94, 150, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              //backgroundColor: Color.fromRGBO(144, 94, 150, 1),
            ),
          ],
        ),
      ),
    );
  }
}
