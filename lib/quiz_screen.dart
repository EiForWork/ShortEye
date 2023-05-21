import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionsList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {     
    //RETURN
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),    //BG COLORS
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "ทดสอบสายตาสั้น (Early Check)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            _questionWidget(),  //QUESTIONS 
            _answerList(),   //ANWSER LIST
            _nextButton(),   //NEXT AND SUBMIT BUTTON
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionsList.length.toString()}",   // QUESTION NUMBER TEXT 4/4
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center, //CENTER YELLOW
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 146, 23),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionsList[currentQuestionIndex].questionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              
            ),
          ),
        )
      ],
    );
  } //END QUESTIONS WIDGET

  _answerList() {
    return Column(
      children: questionsList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

Widget _answerButton(Answer answer) {
  bool isSelected = answer == selectedAnswer;

  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    height: 48,
    child: ElevatedButton(
      child: Text(answer.answerText),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: isSelected ? Colors.orangeAccent : Colors.white,
        onPrimary: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () {
        if (selectedAnswer == null) {
          setState(() {
            selectedAnswer = answer;
            if (answer.isCorrect) {
              score++;
            }
          });
        } else if (selectedAnswer != answer) {
          // Check if the new answer is different from the selected one
          setState(() {
            if (selectedAnswer!.isCorrect) {
              score--; // Decrement the score as the previous answer was correct
            }
            selectedAnswer = answer;
            if (answer.isCorrect) {
              score++;
            }
          });
        }
      },
    ),
  );
}




  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionsList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            ///Display score
          showDialog(context: context, builder:(_) => _showScoreDialog() );
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }


_showScoreDialog(){
  bool isPassed = false;
  if(score >= questionsList.length*0.6){
    isPassed = true;
  }
String title = isPassed?"Your Score is":"Your Score is";


  return AlertDialog(
    title: Text(title+" $score"),
    content: ElevatedButton(child:const Text("Continue"),onPressed:(){
      Navigator.pop(context);
      setState(() {
      currentQuestionIndex =0;
      score = 0;
      selectedAnswer = null;
      });
    },),
  );
}



}
