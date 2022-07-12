// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, file_names

// import 'package:first_app/Home/HomePage.dart';
import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Icon(
            Icons.home,
            size: 140,
            color: Color.fromARGB(134, 180, 42, 18),
          ),
        ),
      ),
    );
  }
}
