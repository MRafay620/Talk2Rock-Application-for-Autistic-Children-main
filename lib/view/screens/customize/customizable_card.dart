import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Card {
  String name;
  String imageUrl;

  Card(this.name, this.imageUrl);
}

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  _CardListScreenState createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  List<Card> cards = [];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  void _loadCards() async {
    QuerySnapshot querySnapshot = await firestore.collection('cards').get();
    List<Card> loadedCards = [];
    for (var doc in querySnapshot.docs) {
      loadedCards.add(Card(doc['name'], doc['imageUrl']));
    }
    setState(() {
      cards = loadedCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card List'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(cards[index].imageUrl),
            title: Text(cards[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomizableCardScreen(
                    existingCard: cards[index],
                  ),
                ),
              ).then((value) {
                if (value == true) {
                  _loadCards();
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CustomizableCardScreen()),
          ).then((value) {
            if (value == true) {
              _loadCards();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomizableCardScreen extends StatefulWidget {
  final Card? existingCard;

  const CustomizableCardScreen({super.key, this.existingCard});

  @override
  _CustomizableCardScreenState createState() => _CustomizableCardScreenState();
}

class _CustomizableCardScreenState extends State<CustomizableCardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingCard != null) {
      _nameController.text = widget.existingCard!.name;
      _imageUrlController.text = widget.existingCard!.imageUrl;
    }
  }

  void _saveCardData() async {
    if (widget.existingCard != null) {
      await firestore
          .collection('cards')
          .doc(widget.existingCard!.name)
          .update({
        'name': _nameController.text,
        'imageUrl': _imageUrlController.text,
      });
    } else {
      await firestore.collection('cards').doc(_nameController.text).set({
        'name': _nameController.text,
        'imageUrl': _imageUrlController.text,
      });
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.existingCard != null ? 'Edit Card' : 'Create Custom Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            ElevatedButton(
              onPressed: _saveCardData,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
