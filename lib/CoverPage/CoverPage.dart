import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({Key? key}) : super(key: key);

  static const titleText = 'First App';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          titleText,
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
