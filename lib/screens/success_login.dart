import 'package:flutter/material.dart';

class SuccessfulLogin extends StatelessWidget {
  const SuccessfulLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Log In Successfully...",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
