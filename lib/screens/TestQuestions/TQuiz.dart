import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/bloc/bloc_export.dart';
import 'package:evaltech_mobile/screens/QuizScreen/score/score_screen.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:flutter/material.dart';

import '../../Constant/constants.dart';
import '../../bloc/MCQBloc/mcq_state.dart';
import '../../models/Exercise.dart';
import '../../models/MCQ.dart';

class TQuiz extends StatefulWidget {
  final MCQ mcq;

  const TQuiz({Key? key, required this.mcq}) : super(key: key);

  @override
  _TQuizState createState() => _TQuizState();
}

class _TQuizState extends State<TQuiz> {
  late List<Exercise> _exercises;
  late int _currentIndex;
  late List<int> _selectedAnswers;
  int _correctAnswers = 0; // variable to track number of correct answers
  int _totalQuestion = 0; // variable to track number of correct answers

  @override
  void initState() {
    super.initState();
    _exercises = widget.mcq.exercises;
    _currentIndex = 0;
    _currentIndex = 0;
    _totalQuestion = 0;
    _selectedAnswers = List.filled(_exercises.length, -1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MCQBloc, MCQState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 100),
                Expanded(child: QuestionCard()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget QuestionCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 235, 220, 220),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: kDefaultPadding / 2),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _exercises[_currentIndex].question,
              style: AppTextTheme.title,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _exercises[_currentIndex].answers.length,
              itemBuilder: (context, index) {
                final answer = _exercises[_currentIndex].answers[index];
                return Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: RadioListTile(
                    title: Text(answer.label),
                    value: index,
                    groupValue: _selectedAnswers[_currentIndex],
                    onChanged: (int? value) {
                      setState(() {
                        _selectedAnswers[_currentIndex] = value!;
                        _totalQuestion++;
                        if (answer.correct) {
                          _correctAnswers++; // increment correct answer count
                        }
                      });
                    },
                    activeColor: answer.correct ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex--;
                      });
                    },
                    child: Text('Previous'),
                  ),
                if (_currentIndex < _exercises.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex++;
                      });
                    },
                    child: Text('Next'),
                  ),
                if (_currentIndex == _exercises.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      NavigationScreen.replaceNavigate(
                          context,
                          ScoreScreen(
                            score: _correctAnswers,
                            totalquestion: _totalQuestion,
                          ));
                    },
                    child: Text('Submit'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
