import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

// ignore: must_be_immutable
class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxWidget> {
  bool isChecked = false;

  void _onChangedHandler (bool value) {
    setState(() {
      isChecked = value;
    });
    globals.isCheckboxChecked = !globals.isCheckboxChecked;
  }
  
  bool checked() {
    return this.isChecked;
  }

  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      contentPadding: EdgeInsets.all(0),
      onChanged: _onChangedHandler,
      title: Text('Remeber me'),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}