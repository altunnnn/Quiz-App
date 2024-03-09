import "package:flutter/material.dart";

class Answers extends StatelessWidget {
  Answers({super.key, required this.answers, required this.onTop});
  final String answers;
  final void Function() onTop;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTop,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: Color.fromARGB(66, 101, 5, 226),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answers,
        textAlign: TextAlign.center,
      ),
    );
  }
}
