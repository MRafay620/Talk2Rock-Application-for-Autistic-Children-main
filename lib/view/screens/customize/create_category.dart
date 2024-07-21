import 'package:autism/models/my_cateogory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Card {
  String? name;
  String? image;

  Card(this.name, this.image);
}

class CreateCategoryScreen extends StatefulWidget {
  final Card? existingCard;
  const CreateCategoryScreen({super.key, this.existingCard});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

enum TTsState { playing, stopped }

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final formKey = GlobalKey<FormState>();
  final currentUser = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final pointController = TextEditingController();
  List<Card> cards = [];
  final picker = ImagePicker();
  File? _imageFile;
  bool _isUploading = false;
  late FlutterTts _flutterTts;
  String? _tts;
  TTsState _tTsState = TTsState.stopped;

  List<String> points = [];

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  @override
  void initState() {
    super.initState();
    initTts();
    if (widget.existingCard != null) {
      _nameController.text = widget.existingCard!.name!;
      _imageController.text = widget.existingCard!.image.toString();
    }
  }

  initTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts.awaitSpeakCompletion(true);

    _flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        _tTsState = TTsState.playing;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        print("Comlete");
        _tTsState = TTsState.stopped;
      });
    });

    _flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        _tTsState = TTsState.stopped;
      });
    });

    _flutterTts.setErrorHandler((message) {
      setState(() {
        print("Error: $message");
        _tTsState = TTsState.stopped;
      });
    });
  }

  Future<String?> _uploadImage() async {
    String url = '';

    setState(() {
      _isUploading = true;
    });
    try {
      final storage = FirebaseStorage.instance;
      final ref = storage
          .ref()
          .child('images/${currentUser!.uid}/${DateTime.now()}.jpg');
      final uploadTask = await ref.putFile(_imageFile!);
      url = await uploadTask.ref.getDownloadURL();
      setState(() {
        _imageFile = null;
      });

      return url;
    } catch (err) {
      setState(() {
        _isUploading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to upload image'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return null;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveCardData(String url) async {
    final name = _nameController.text.trim();
    final myCategory = MyCategory(name: name, imageUrl: url, points: points);

    final doc = firestore.collection('my-categories').doc(currentUser!.uid);
    final docData = await doc.get();
    if (docData.exists) {
      await doc.update({
        'categories': FieldValue.arrayUnion([myCategory.toMap()]),
      });
    } else {
      await doc.set({
        'categories': FieldValue.arrayUnion([myCategory.toMap()]),
      });
    }

    setState(() {
      _isUploading = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(144, 94, 150, 1),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      BackButton(
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add New Category',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                    child: GestureDetector(
                      child: Center(
                        child: _isUploading
                            ? const CircularProgressIndicator(
                                color: Color.fromRGBO(255, 143, 177, 1),
                              )
                            : _imageFile == null
                                ? const Text(
                                    'No image selected',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'AkayaTelivigala',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: FileImage(
                                          _imageFile!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: const Color.fromRGBO(255, 143, 177, 1),
                        onPressed: () => _pickImage(ImageSource.gallery),
                        tooltip: 'Pick Image from Gallery',
                        child: const Icon(Icons.add_a_photo),
                      ),
                      const SizedBox(width: 20),
                      FloatingActionButton(
                        backgroundColor: const Color.fromRGBO(255, 143, 177, 1),
                        onPressed: () => _pickImage(ImageSource.camera),
                        tooltip: 'Pick Image from Camera',
                        child: const Icon(Icons.camera_alt),
                      ),
                      if (_imageFile != null) ...[
                        const SizedBox(width: 20),
                        FloatingActionButton(
                          backgroundColor:
                              const Color.fromRGBO(255, 143, 177, 1),
                          onPressed: () {
                            setState(() {
                              _imageFile = null;
                            });
                          },
                          tooltip: 'Remove image',
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                      controller: _nameController,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'AkayaTelivigala',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.add),
                        hintText: 'Category name',
                        hintStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'AkayaTelivigala',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(255, 143, 177, 1),
                                width: 0.0)),
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 143, 177, 1),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            button(),
                          ],
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Category name cannot be empty!";
                        }

                        return null;
                      },
                      onChanged: (String value) {
                        setState(() {
                          _tts = value;
                        });
                      }),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: pointController,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'AkayaTelivigala',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.edit),
                      hintText: 'Write One or More Points about Category',
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'AkayaTelivigala',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 143, 177, 1),
                              width: 0.0)),
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 143, 177, 1),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buttonOne(),
                        ],
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _tts = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        if (points.contains(value)) {
                          const sk =
                              SnackBar(content: Text("Point already exists!"));
                          ScaffoldMessenger.of(context).showSnackBar(sk);
                          return;
                        }

                        setState(() {
                          points.add(value);
                        });
                        pointController.clear();
                      }
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ...points.asMap().entries.map(
                        (e) => ListTile(
                          title: Text('${e.key + 1}. ${e.value}',
                              style: const TextStyle(color: Colors.white)),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                points.remove(e.value);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: _imageFile == null ||
                            _nameController.text.isEmpty ||
                            points.isEmpty ||
                            _isUploading
                        ? null
                        : () async {
                            // upload image
                            final url = await _uploadImage();

                            // upload data
                            _saveCardData(url!);
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      maximumSize: const Size(100, 50),
                      backgroundColor: const Color.fromRGBO(255, 143, 177, 1),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'AkayaTelivigala',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    if (_tTsState == TTsState.stopped) {
      return IconButton(
        icon: const Icon(Icons.volume_up),
        onPressed: speak,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.stop),
        onPressed: stop,
      );
    }
  }

  Widget buttonOne() {
    if (_tTsState == TTsState.stopped) {
      return IconButton(
        icon: const Icon(Icons.volume_up),
        onPressed: speak,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.stop),
        onPressed: stop,
      );
    }
  }

  Future speak() async {
    await _flutterTts.setVolume(1);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1);

    if (_tts != null) {
      if (_tts!.isNotEmpty) {
        await _flutterTts.speak(_tts!);
      }
    }
  }

  Future stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) {
      setState(() {
        _tTsState = TTsState.stopped;
      });
    }
  }
}
