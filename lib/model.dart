class Question {
  String questionText;
  List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  String text;
  bool iscorrect;
  Answer(this.text, this.iscorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];
  list.add(Question("who is owner flutter", [
    Answer("google", true),
    Answer("oppo", false),
    Answer("samsumg", false),
  ]),
  );
   list.add(Question("2+3", [
    Answer("5", true),
    Answer("6", false),
    Answer("7", false),
  ]));
   list.add(Question("7/7==2", [
    Answer("true", false),
    Answer("false", true),
   
  ]),);
  return list;
}
