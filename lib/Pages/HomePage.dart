import 'package:flutter/material.dart';
import '../components/LoginForm.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zvia Ashkelon Lavi Project',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.deepPurple),
        child: Center(
          child: FractionallySizedBox(
              widthFactor: 0.8,
              alignment: Alignment.center,
              child: LoginForm()),
        ),
      ),
    );
  }
}

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}
