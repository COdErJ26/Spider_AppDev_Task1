import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DownTemp extends StatefulWidget {
  @override
  State<DownTemp> createState() => _DownState();
}

class _DownState extends State<DownTemp> {
  void _showToast(BuildContext context, String textToBeShown) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          textToBeShown,
          style: TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        action:
            SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  var tempset = true;

  int checking() {
    if (dropdownvalue1 == 'Celcius' && dropdownvalue2 == 'Fahrenheit') {
      return 1;
    } else if (dropdownvalue1 == dropdownvalue2) {
      return 2;
    } else {
      return 3;
    }
  }

  var iscolor = 1;
  var textAns = '';

  TextEditingController unitVal = TextEditingController();
  TextEditingController unitVal1 = TextEditingController();
  TextEditingController unitVal2 = TextEditingController();

  String dropdownvalue1 = 'Celcius';
  String dropdownvalue2 = 'Fahrenheit';

  var items = ['Celcius', 'Fahrenheit'];
  var textshown = 'Answer here!';

  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: iscolor == 2 ? Colors.green : Colors.grey[300],
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: unitVal,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the value',
                  hintText: 'input value',
                )),
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  value: dropdownvalue1,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue1 = newValue!;
                    });
                  },
                ),
                DropdownButton(
                  value: dropdownvalue2,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue2 = newValue!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  onPressed: (() {
                    if (unitVal.text == '') {
                      _showToast(context, 'Invalid input!');
                    }
                    int condition = checking();

                    if (condition == 1) {
                      setState(() {
                        answer =
                            '${((double.parse(unitVal.text) * 1.8) + 32).toStringAsFixed(3)}';
                      });
                    } else if (condition == 3) {
                      setState(() {
                        answer =
                            '${((double.parse(unitVal.text) - 32) / 1.8).toStringAsFixed(3)}';
                      });
                    } else if (condition == 2) {
                      setState(() {
                        answer = unitVal.text;
                      });
                    }
                  }),
                  child: Text('Convert'),
                ),
                SizedBox(
                  width: 120.0,
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 28.0),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        unitVal.text = '';
                        answer = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                    child: Text('Clear'))
              ],
            ),
          ]),
        ]));
  }
}

class convertTemp extends StatefulWidget {
  const convertTemp({Key? key}) : super(key: key);

  @override
  State<convertTemp> createState() => _convertTempState();
}

class _convertTempState extends State<convertTemp> {
  void _showToast(BuildContext context, String textToBeShown) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          textToBeShown,
          style: TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        action:
            SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  var tempset = true;

  int checking() {
    if (dropdownvalue1 == 'Celcius' && dropdownvalue2 == 'Fahrenheit') {
      return 1;
    } else if (dropdownvalue1 == dropdownvalue2) {
      return 2;
    } else {
      return 3;
    }
  }

  var iscolor = 1;
  var textAns = '';

  TextEditingController unitVal1 = TextEditingController();
  TextEditingController unitVal2 = TextEditingController();

  String dropdownvalue1 = 'Celcius';
  String dropdownvalue2 = 'Fahrenheit';

  var items = ['Celcius', 'Fahrenheit'];
  var textshown = 'Answer here!';

  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: iscolor == 2 ? Colors.green : Colors.grey[300],
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton(
              value: dropdownvalue1,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                });
              },
            ),
            DropdownButton(
              value: dropdownvalue2,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue2 = newValue!;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 120.0,
              child: Text(
                answer,
                style: TextStyle(fontSize: 28.0),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.0,
              width: 130.0,
              child: TextField(
                  controller: unitVal1,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the value',
                  )),
            ),
            SizedBox(
              height: 30.0,
              width: 130.0,
              child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  controller: unitVal2,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the value',
                  )),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.purple),
          onPressed: (() {
            int condition = checking();
            if (condition == 1) {
              if ((double.parse(unitVal1.text)).toStringAsFixed(1) ==
                  ((double.parse(unitVal2.text) - 32) / 1.8)
                      .toStringAsFixed(1)) {
                HapticFeedback.heavyImpact();
                _showToast(context, 'Voila! That\'s correct');

                setState(() {
                  {
                    textshown = 'crt';
                    textAns = '';
                    iscolor = 2;
                  }
                });
              } else {
                setState(() {
                  _showToast(context, 'Try Again..');
                  textshown = 'wrong';
                  iscolor = 1;
                  textAns = ((double.parse(unitVal1.text) * 1.8) + 32)
                      .toStringAsFixed(2);
                });
              }
              ;
            } else if (condition == 3) {
              if ((double.parse(unitVal1.text)).toStringAsFixed(1) ==
                  ((double.parse(unitVal2.text) - 32) / 1.8)
                      .toStringAsFixed(1)) {
                _showToast(context, 'Voila! That\'s correct');
                setState(() {
                  {
                    textshown = 'crt';
                    iscolor = 2;
                    textAns = '';
                  }
                });
              } else {
                _showToast(context, 'Try Again..');
                setState(() {
                  iscolor = 1;
                  textshown = 'wrong';
                  textAns = ((double.parse(unitVal1.text) * 1.8) + 32)
                      .toStringAsFixed(1);
                });
              }
            } else if (condition == 2) {
              if (double.parse(unitVal1.text).toStringAsFixed(1) ==
                  double.parse(unitVal2.text).toStringAsFixed(1)) {
                _showToast(context, 'Voila! That\'s correct');
                setState(() {
                  textshown = 'crt';
                  iscolor = 2;
                  textAns = '';
                });
              } else {
                setState(() {
                  textshown = 'wrong';
                  iscolor = 1;
                });
              }
            } else {
              _showToast(context, 'Invalid !!');
              () {
                setState(() {
                  textshown = 'Wrong!';
                });
              };
            }
          }),
          child: Text('Check here!'),
        ),
        Text(textshown),
        Text('Correct Answer is $textAns'),
      ]),
    );
  }
}
