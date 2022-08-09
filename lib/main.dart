import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spider_app/cards.dart';
import 'package:spider_app/downlength.dart';
import 'package:spider_app/downspeed.dart';
import 'package:spider_app/downweight.dart';
import 'package:spider_app/downtemp.dart';
import 'cards.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FrontPage(),
        '/home': (context) => Home(),
        '/check': (context) => CheckScreen(),
      },
    ),
  );
}

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Unit converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose any option!'),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 50.0,
              width: 150.0,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Icon(
                  Icons.autorenew,
                  size: 30.0,
                ),
                label: Text('Convert'),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 50.0,
              width: 150.0,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  Navigator.pushNamed(context, '/check');
                },
                icon: Icon(
                  Icons.border_color,
                  size: 30.0,
                ),
                label: Text('Check'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var c;

  var tempset = true;

  var answer = '';

  String currentProp = '';
  List<String> properties = ['Temp', 'Length', 'Weight', 'Speed'];

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text(
            'Convert',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cards('Temp', () {
                  setState(() {
                    c = 1;
                  });
                  var a = this.properties[0];
                }, Icon(Icons.thermostat)),
                Cards('Length', () {
                  setState(() {
                    c = 2;
                  });
                }, Icon(Icons.crop_portrait)),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Cards('Weight', () {
                setState(() {
                  c = 4;
                });
              }, Icon(Icons.balance)),
              Cards('Speed', () {
                setState(() {
                  c = 3;
                });
              }, Icon(Icons.airport_shuttle))
            ]),
            Divider(
              color: Colors.black,
            ),
            condition(),
          ],
        ));
  }

  Widget condition() {
    Widget widget;

    switch (c) {
      case 1:
        widget = DownTemp();
        break;
      case 2:
        widget = DownLength();
        break;
      case 3:
        widget = DownSpeed();
        break;
      case 4:
        widget = DownWeight();
        break;

      default:
        widget = Container(
          child: Text('Choose any option above!'),
        );
    }

    return widget;
  }
}

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  var c;

  var tempset = true;

  var answer = '';

  String currentProp = '';
  List<String> properties = ['Temp', 'Length', 'Weight', 'Speed'];

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text(
            'Check',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cards('Temp', () {
                  setState(() {
                    c = 1;
                  });
                  var a = this.properties[0];
                }, Icon(Icons.thermostat)),
                Cards('Length', () {
                  setState(() {
                    c = 2;
                  });
                }, Icon(Icons.crop_portrait)),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Cards('Weight', () {
                setState(() {
                  c = 4;
                });
              }, Icon(Icons.balance)),
              Cards('Speed', () {
                setState(() {
                  c = 3;
                });
              }, Icon(Icons.airport_shuttle))
            ]),
            Divider(
              color: Colors.black,
            ),
            condition(),
          ],
        ));
  }

  Widget condition() {
    Widget widget;

    switch (c) {
      case 1:
        widget = convertTemp();
        break;
      case 2:
        widget = convertlength();
        break;
      case 3:
        widget = convertSpeed();
        break;
      case 4:
        widget = convertWeight();
        break;

      default:
        widget = Container(
          child: Text('Choose any option above!'),
        );
    }

    return widget;
  }
}
