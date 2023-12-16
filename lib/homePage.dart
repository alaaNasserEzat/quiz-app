import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import 'package:quiz/model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> list = getQuestion();

  int curindx = 0;
  int score = 0;
  Answer? selectedanswer;

  @override
  Widget build(BuildContext context) {
    int f = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "sample quiz app",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Text(
            "Question ${curindx + 1} / ${list.length}",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 50,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  list[curindx].questionText,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                  left: -20,
                  top: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  )),
              Positioned(
                  right: -20,
                  top: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  top: -27,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check_sharp,
                        size: 30,
                        color: Colors.green,
                      )))
            ],
          ),
          Column(
            children: [
              for (Answer answer in list[curindx].answerList)
                answerbutton(answer)
            ],
          ),
          nextbutton()
        ],
      ),
    );
  }

  nextbutton() {
    int f = 0;
    if (curindx == list.length - 1) f = 1;
    return AnimatedButton(
        onPressed: () {
          if (f == 1) {
            //display score
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text(
                        "${score >= list.length * .6 ? "pass" : 'faild'} | score is ${score.toString()}",
                        style: TextStyle(fontSize: 20,color: score >= list.length * .6 ?Colors.black:Colors.red),
                      ),
                      content:AnimatedButton(child: Text("reset") ,onPressed: (){
                        Navigator.pop(context);
                    setState(() {
                          curindx=0;
                        selectedanswer=null;
                        score=0;
                        
                    });
                      },)
                      
                      
                    ));
          } else {
            if (selectedanswer == null) {
            } else {
              setState(() {
                curindx++;
                selectedanswer = null;
              });
            }
          }
        },
        child: Text(
          curindx == list.length - 1 ? "sumbit" : "next",
          style: TextStyle(fontSize: 24),
        ));
  }

  answerbutton(Answer answer) {
    bool isselected = answer == selectedanswer;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimatedButton(
          color: isselected ? Colors.orange : Colors.white,
          onPressed: () {
            if (selectedanswer == null) {
              if (answer.iscorrect) {
                score++;
              }
            }
            setState(() {
              selectedanswer = answer;
            });
          },
          child: Text(answer.text)),
    );
  }
}
