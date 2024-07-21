import 'package:autism/view/screens/home/components/item_card.dart';
import 'package:autism/view/screens/home/components/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:autism/constants.dart';
import 'package:autism/models/necessity.dart';

class SubCategories extends StatefulWidget {

  final Necessity necessities;
  SubCategories({required this.necessities});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(144, 94, 150, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(widget.necessities.category,
            style: TextStyle(
                color: Color.fromRGBO(255, 211, 114, 1),
                fontFamily: dfont,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.volume_up_sharp,
              color: Colors.black,
              //  color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        backgroundColor: Color.fromRGBO(144, 94, 150, 1),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                  itemCount:widget.necessities.subcategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                    childAspectRatio: 0.75,
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => SubItemCard(
                      subcategory: widget.necessities.subcategories[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(subCategories: widget.necessities.subcategories[index]),

                      )
                  ),
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
