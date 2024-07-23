import 'package:flutter/material.dart';


enum Mode {
  poem('시'),
  novel('단어'),
  word('속담'),
  custom('나만의글');

  const Mode(this.kor);
  final String kor;
}

class ModeCard extends StatelessWidget {
  const ModeCard({
    super.key,
    required this.modeTitle,
    required this.onSelectedMode,
  });

  final String modeTitle;
  final void Function() onSelectedMode;

  @override
  Widget build(BuildContext context) {
    final mySize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onSelectedMode,
      child: SizedBox(
        width: mySize.width * 0.45,
        height: mySize.height * 0.24,
        child: Card(
          child: Center(
            child: Text(
              modeTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
