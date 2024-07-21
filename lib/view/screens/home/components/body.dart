import 'package:autism/models/necessity.dart';
import 'package:autism/static/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autism/constants.dart';
import 'package:autism/view/screens/home/components/categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final currentUser = FirebaseAuth.instance.currentUser;

  List<Necessity> filtered = [];
  bool hasFilter = false;

  void searchCategory(String? query) {
    setState(() {
      if (query == null || query.isEmpty) {
        filtered = [];
        hasFilter = false;
        return;
      }

      hasFilter = true;
      filtered = necessity
          .where(
            (category) => category.category //
                .toLowerCase()
                .contains(
                  query.toLowerCase(),
                ),
          )
          .toList(growable: false)
        ..sort(
          (a, b) => a.category
              .toLowerCase() //
              .indexOf(query.toLowerCase())
              .compareTo(
                b.category.toLowerCase().indexOf(
                      query.toLowerCase(),
                    ),
              ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Necessity> list = necessity;
    if (hasFilter) {
      list = filtered;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Center(
            child: Text(
              currentUser?.displayName != null
                  ? "Hello ${currentUser?.displayName}!!"
                  : 'Hello there!',
              // "Hello ${currentUser?.displayName}!!",
              style: const TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(255, 211, 114, 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            hintText: 'Search',
          ),
          onChanged: (value) {
            searchCategory(value);
          },
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: hasFilter && list.isEmpty
                ? const Center(
                    child: Text('No match found, try again!'),
                  )
                : GridView.builder(
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                      childAspectRatio: 0.75,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => ItemCard(
                        necessity: list[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategories(
                                necessities: list[index],
                              ),
                            ))),
                  ),
          ),
        ),
      ],
    );
  }
}
