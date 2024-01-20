// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:choose_the_correct_answer/appQuestions.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  List<Padding> answerResault = [];

  AppQuestions appQustion = AppQuestions();

  int rightAnswer = 0;

  void check(bool answer) {
    setState(() {
      if (appQustion.getQuestionAnswer() == answer) {
        rightAnswer++;
        answerResault.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResault.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appQustion.isFinished()) {
        Alert(
          context: context,
          title: "لقد أنتهيت من الإختبار",
          desc: "أحسنت لقد قمت بالإجابة على $rightAnswer من 7 أسئلة",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: Text(
                "إعادة الإختبار",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        appQustion.reset();
        answerResault = [];
        rightAnswer = 0;
      } else {
        appQustion.nextQustion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("إختبار"),
        centerTitle: true,
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: answerResault),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Image.asset(
                        appQustion.getQuestionImage(),
                        height: 300,
                        width: 400,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        appQustion.getQuestionText(),
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            check(true);
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        child: Text(
                          "صحيح",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            check(false);
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                        child: Text(
                          "خطأ",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
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
