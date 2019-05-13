import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Label with Buttons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _LabeledCheckbox extends StatelessWidget {
  const _LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;

  final EdgeInsets padding;

  final bool value;
  
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (bool newValue) => onChanged(newValue),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _LabeledRadio extends StatelessWidget {
  const _LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;

  final EdgeInsets padding;

  final bool groupValue;

  final bool value;
  
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool newValue) => onChanged(newValue),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _LabeledSwitch extends StatelessWidget {
  const _LabeledSwitch({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;

  final EdgeInsets padding;

  final bool groupValue;

  final bool value;
  
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        padding: padding,
        child: Row(
          children: <Widget>[
            Switch(
              value: value,
              onChanged: (bool newValue) => onChanged(newValue),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCheckBoxSelected = false;

  bool isRadioSelected = false;

  bool isSwitchSelected = false;

  String label = 'This is the label';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _LabeledCheckbox(
            label: label,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            value: isCheckBoxSelected,
            onChanged: (bool newValue) {
              setState(() {
                isCheckBoxSelected = newValue;
              });
            },
          ),
          _LabeledRadio(
            label: label,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            value: isRadioSelected,
            groupValue: true,
            onChanged: (bool newValue) {
              setState(() {
                isRadioSelected = newValue;
              });
            },
          ),
          _LabeledSwitch(
            label: label,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            value: isSwitchSelected,
            groupValue: true,
            onChanged: (bool newValue) {
              setState(() {
                isSwitchSelected = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
