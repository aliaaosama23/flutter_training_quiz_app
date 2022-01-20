import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {Key? key,
      required this.answerText,
      required this.btnColor,
      required this.onPress})
      : super(key: key);
  final String answerText;
  final VoidCallback? onPress;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 25),
            ),
          ),
          onPressed: onPress,
          child: Text(answerText),
        ),
      ),
    );
  }
}
