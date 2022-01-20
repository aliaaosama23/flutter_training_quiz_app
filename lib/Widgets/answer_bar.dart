import 'package:flutter/material.dart';

class AnswersBar extends StatelessWidget {
  const AnswersBar({
    Key? key,
    required this.scoreResults,
  }) : super(key: key);

  final List<Icon> scoreResults;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: scoreResults,
      ),
    );
  }
}
