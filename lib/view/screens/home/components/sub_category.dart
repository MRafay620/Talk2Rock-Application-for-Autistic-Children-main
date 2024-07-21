import 'package:autism/models/my_cateogory.dart';
import 'package:flutter/material.dart';
import 'package:autism/models/necessity.dart';
import 'package:autism/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DetailScreen extends StatefulWidget {
  final MyCategory subCategories;
  DetailScreen({Key? key, required this.subCategories}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late FlutterTts _flutterTts;
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _flutterTts = FlutterTts();
    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  void _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  Widget _buildCancelButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.0),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          color: Color.fromRGBO(255, 211, 114, 1),
        ),
        label: Text(
          'Cancel',
          style: TextStyle(
            color: Color.fromRGBO(255, 211, 114, 1),
            fontFamily: dfont,
            fontSize: 24.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        ),
      ),
    );
  }

  Widget _buildTextWithSoundIcon(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon:
                Icon(Icons.volume_up, color: Color.fromRGBO(255, 211, 114, 1)),
            onPressed: () => _speak(text),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Color.fromRGBO(255, 211, 114, 1),
            fontFamily: dfont,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(144, 94, 150, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(144, 94, 150, 1),
        title: Text(
          widget.subCategories.name,
          style: TextStyle(
            color: Color.fromRGBO(255, 211, 114, 1),
            fontFamily: dfont,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.subCategories.imageUrl.contains('.com')
                        ? NetworkImage(
                            widget.subCategories.imageUrl,
                          )
                        : AssetImage(widget.subCategories.imageUrl)
                            as ImageProvider,
                    fit: BoxFit.scaleDown,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(height: 20),
              /* _buildTextWithSoundIcon("\n I like ${widget.subCategories.name} "),
              _buildTextWithSoundIcon("\n Can we get ${widget.subCategories.name} as pet?"),
              _buildTextWithSoundIcon("\n I need to feed my ${widget.subCategories.name} "),
              _buildTextWithSoundIcon("\n I need to clean my ${widget.subCategories.name} "),
              _buildTextWithSoundIcon("\n I saw a ${widget.subCategories.name} "),*/
              _buildCancelButton(),
              ...widget.subCategories.points.map((sub) {
                return _buildTextWithSoundIcon(sub);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
