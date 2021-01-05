import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final notNumeric = RegExp('[a-zA-Z]');
  final _idController = new TextEditingController();
  final _passwordController = new TextEditingController();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 30,
        children: <Widget>[
          TextFormField(
            controller: _idController,
            decoration: InputDecoration(hintText: 'ID'),
            validator: (value) {
              if (value.isEmpty ||
                  notNumeric.hasMatch(value) ||
                  value.length != 9) {
                return 'ID number is required, and must be only from numbers. also, the length of an ID number should be 9 numbers long.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(this.isObscure ? Icons.lock : Icons.lock_open),
                  onPressed: () {
                    setState(() {
                      this.isObscure = !this.isObscure;
                    });
                  },
                )),
            obscureText: this.isObscure,
            validator: (value) {
              if (value.isEmpty) {
                return 'required field.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                if (_idController.text == '216331470' &&
                    _passwordController.text == 'Ilay9876') {
                  showSnackbar(context, 'Hey, Ilay!');
                } else {
                  showSnackbar(context, 'Who are you??');
                }
              }
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}
