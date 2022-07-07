import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const titleText = 'First App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(titleText),
      ),
      body: const Center(
        child: Text(
          titleText,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
