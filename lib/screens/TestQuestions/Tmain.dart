import 'package:evaltech_mobile/screens/TestQuestions/TQuiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../bloc/MCQBloc/mcq_state.dart';
import '../../bloc/bloc_export.dart';

class Tmain extends StatelessWidget {
  const Tmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MCQBloc, MCQState>(
      builder: (context, state) {
        return Scaffold(
          body: TQuiz(mcq: state.allMCQs[2]),
        );
      },
    );
  }
}
