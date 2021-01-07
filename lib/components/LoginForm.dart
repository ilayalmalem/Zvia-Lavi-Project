import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './globals.dart' as globals;
import '../main.dart';
import './checkbox.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final notNumeric = RegExp('[a-zA-Z]');
  final _idController = new TextEditingController();
  final _passwordController = new TextEditingController();
  bool isCheckboxChecked = false;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [HexColor('#000428'), HexColor('#004E92')]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(52.0),
          child: Center(
              child: Form(
            key: _formKey,
            child: Wrap(
              runSpacing: 20,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/logo.svg'),
                      Divider(),
                        Text('RemoteEpsilon',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                               fontSize: 18
                            )
                        )
                    ],
                  ),
                ),
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(hintText: "ID"),
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
                        icon:
                            Icon(this.isObscure ? Icons.lock : Icons.lock_open),
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
                CheckboxWidget(),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#FF5791'),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (_idController.text == '216331470' &&
                            _passwordController.text == 'Ilay9876') {
                          String remember = globals.isCheckboxChecked ? 'Remembering you.' : 'Im\'a act like I never saw you.';
                          showSnackbar(context, 'Hey, Ilay! $remember');
                        } else {
                          showSnackbar(context, 'Who are you??');
                        }
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          )),
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
