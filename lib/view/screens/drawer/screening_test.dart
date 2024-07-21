import 'package:flutter/material.dart';

class AutismScreeningTest extends StatefulWidget {
  @override
  _AutismScreeningTestState createState() => _AutismScreeningTestState();
}

class _AutismScreeningTestState extends State<AutismScreeningTest> {
  List<String> selectedAnswers = List.filled(10, '');

  final List<String> questions = [
    '1. Does your child look at you when you call his/her name?',
    '2. How easy is it for you to get eye contact with your child? ',
    '3. Does your child point to indicate that s/he wants something? (e.g. a toy that is out of reach)',
    '4. Does your child point to share interest with you? (e.g. poin9ng at an interes9ng sight)',
    '5. Does your child pretend? (e.g. care for dolls, talk on a toy phone)',
    '6. Does your child follow where you’re looking? ',
    '7. If you or someone else in the family is visibly upset, does your child show signsof wantng to comfort them? (e.g. stroking hair, hugging them)',
    '8. Would you describe your child’s first words as:',
    '9. Does your child use simple gestures? (e.g. wave goodbye) ',
    '10. Does your child stare at nothing with no apparent purpose?',
  ];

  final List<String> answers = [
    'a: Always',
    'u: Usually',
    's: Sometimes',
    'r: Rarely',
    'n: Never',
  ];

  bool showWarning = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autism Screening Test'),
        backgroundColor: Color.fromRGBO(144, 94, 150, 1),
      ),
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // Add spacing between the title bar and the first question
          children: [
            if (showWarning)
              Container(
                color: Colors.amber[100],
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'WARNING: This test is not a diagnosis. It is only a screening tool. Consult with your child\'s doctor if you are concerned about your child\'s development.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showWarning = false;
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            Flexible(
              child: ListView.builder(
                padding:
                    EdgeInsets.all(16), // Add spacing between the questions
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      questions[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: answers.map((answer) {
                        List<String> parts = answer.split(':');
                        String displayAnswer = parts[1].trim();
                        String value = parts[0];

                        return InkWell(
                          onTap: () {
                            setState(() {
                              String value = parts[0];
                              if (index != 9 &&
                                  (value == 's' ||
                                      value == 'r' ||
                                      value == 'n')) {
                                selectedAnswers[index] = '1';
                              } else if (index == 9 &&
                                  (value == 'a' ||
                                      value == 'u' ||
                                      value == 's')) {
                                selectedAnswers[index] = '1';
                              } else {
                                selectedAnswers[index] = '0';
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: selectedAnswers[index] == value,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedAnswers[index] = value;
                                  });
                                },
                              ),
                              SizedBox(
                                  width:
                                      10), // Add space between the checkbox and answer
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      5, // Reduce vertical padding to make checkbox smaller
                                  horizontal:
                                      10, // Reduce horizontal padding to make checkbox smaller
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedAnswers[index] == value
                                      ? Colors.purple
                                      : Color.fromRGBO(255, 143, 177, 1),
                                  //border:
                                  //Border.all(color: Colors.grey.shade400, width: 2),
                                ),
                                child: Text(
                                  displayAnswer,
                                  style: TextStyle(
                                    color: selectedAnswers[index] == value
                                        ? Color.fromRGBO(255, 143, 177, 1)
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int sum = 0;
          for (String answer in selectedAnswers) {
            if (answer == 's' || answer == 'r' || answer == 'n') {
              sum++;
            }
          }

          String result;
          if (sum >= 3) {
            result = 'Your child has autistic traits';
          } else {
            result = 'No autistic traits';
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Result'),
                content: Text(result),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Color.fromRGBO(255, 143, 177, 1),
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        heroTag: 'myButton',
        child: Icon(Icons.add),
      ),
      //backgroundColor: Color.fromRGBO(144, 94, 150, 1),/ // Set the background color
    );
  }
}
