import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback',
          style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 29.0,
        ),),
        backgroundColor: Color.fromRGBO(144, 94, 150, 1),),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 143, 177, 1),
              Color.fromRGBO(144, 94, 150, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please provide your valuable feedback.',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () => _launchEmail(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 143, 177, 1), // set the background color of the button
                  elevation: 5.0, // set the elevation of the button when pressed
                ),
                child: Text('Send Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'team.talk2Rock@gmail.com',
      queryParameters: {'subject': 'Autism Speech Therapy App Feedback'},
    );
    final String emailUrl = emailUri.toString();

    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
  }
}
