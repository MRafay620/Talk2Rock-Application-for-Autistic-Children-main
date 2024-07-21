import 'package:autism/models/my_cateogory.dart';
import 'package:flutter/material.dart';
import 'package:autism/models/necessity.dart';
import 'package:autism/constants.dart';

class ItemCard extends StatelessWidget {
  final Necessity necessity;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.necessity,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              child: SizedBox(
                width: 100, // replace with your desired width
                height: 100, // replace with your desired height
                child: Image.asset(necessity.image),
              ),
              decoration: BoxDecoration(
                color: necessity.color,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Center(
              child: Text(
                necessity.category,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 211, 114, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubItemCard extends StatelessWidget {
  final MyCategory subcategory;
  final VoidCallback press;
  const SubItemCard({
    Key? key,
    required this.subcategory,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: subcategory.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: 100, // replace with your desired width
                height: 100, // replace with your desired height
                child: subcategory.imageUrl.contains('.com')
                    ? Image.network(subcategory.imageUrl)
                    : Image.asset(subcategory.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Center(
              child: Text(
                subcategory.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 211, 114, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
