import 'package:autism/constants.dart';
import 'package:autism/models/my_cateogory.dart';
import 'package:autism/view/screens/home/components/item_card.dart';
import 'package:autism/view/screens/home/components/my_home_page.dart';
import 'package:autism/view/screens/home/components/sub_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyCategoriesScreen extends StatefulWidget {
  const MyCategoriesScreen({super.key});

  @override
  State<MyCategoriesScreen> createState() => _MyCategoriesScreenState();
}

class _MyCategoriesScreenState extends State<MyCategoriesScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = currentUser != null;

    if (!isLoggedIn) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please login for custom categories'),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(kAccentColor),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyHomePage(),
                  ),
                );
              },
              child: const Text(
                'Login or SignUp',
              ),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<DocumentSnapshot?>(
      stream: FirebaseFirestore.instance
          .collection('my-categories')
          .doc(currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        /*    if (snapshot.connectionState == ConnectionState.active && snapshot.data == null) {
          return const Center(
              child: Text(
                  "Currently You Don't have any category."
                      " \n Press Insert Button to Add in Your Collection!"),
          );
        }*/

        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          final raw = snapshot.data!.data() as Map<String, dynamic>?;

          if (raw == null) {
            return const Center(
              child: Text('Please add some categories'),
            );
          }

          final list = raw['categories'] as List;

          final myCategories = List.generate(
            list.length,
            (index) => MyCategory.fromMap(
              list[index],
            ),
          );

          return GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: myCategories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPadding,
              crossAxisSpacing: kDefaultPadding,
              childAspectRatio: 0.75,
            ),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => SubItemCard(
              subcategory: myCategories[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(subCategories: myCategories[index]),
                ),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }

        return const Center(
          child: Text("Something went wrong!"),
        );
      },
    );
  }
}
