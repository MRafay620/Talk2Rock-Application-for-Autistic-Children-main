import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HelpAndSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Help and Support', style: TextStyle(
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
        child: Padding(

          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                QandA(
                  question: 'How this app will help my child?',
                  answer:
                  'This app will help your children in many possible ways. The pictures present in the app will help your chile to communicate effectively by touching the images of required things. All the text related to each image will be converted to voice on touching it. This will help in the speech therapy of your children. You can make the categories of your children personal poseesions, this will not only enhance there communiction but also help them to communcae there basic needs to people aroun them through our app.',
                ),
                QandA(
                  question: 'How do I use the app?',
                  answer:
                  'The app has several features and functionalities that can help toddlers with autism improve their speech. To get started, simply select a feature from the menu and follow the instructions on the screen.',
                ),
                QandA(
                  question: 'How do I add my customized category?',
                  answer:
                  'To add your own categories, go to home screen and selsect "My Category" from bottom of the page. A screen will open, from ther select plus sign putton and add the details of your category there',
                ),
                QandA(
                  question: 'What is Autism Screening Test?',
                  answer:
                  'This is a screening tool that will help parents to identify if there child have Autistic Features or not. However, this test is not a diagnosis. It is only a screening tool. Consult with your child\'s doctor for final authentication.',
                ),
                QandA(
                  question: 'What ages is the app designed for?',
                  answer:
                  'The app is designed for kids aged 5-15 who have been diagnosed with autism spectrum disorder and are receiving speech therapy. However, the app can also be used by older children and adults with autism.',
                ),
                SizedBox(height: 16.0),
                Text(
                  'Additional Resources',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Here are some additional resources that you may find helpful:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                InkWell(
                  onTap: ()  => _launchURL(
                      'https://link.springer.com/article/10.1023/B:JADD.0000037416.59095.d7'),
                  child: Text(
                    'Picture Exchange Communication Effect for Autism Children',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()  => _launchURL(
                      'https://www.sciencedirect.com/science/article/pii/S1077314215001861'),
                  child: Text(
                    'Efeect of Text to speech in Speech Enhancement',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class QandA extends StatelessWidget {
  final String question;
  final String answer;

  const QandA({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Text(
          answer,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
