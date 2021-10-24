import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Week 5: Checking age',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _permission = "";
  Color _permissionColor = Colors.white;

  String _getPermission(int age) {
    if (age < 16) {
      _permissionColor = Colors.redAccent;
      return "Лучше посмотри мультики";
    } else if (age >= 16 && age < 18) {
      _permissionColor = Colors.yellowAccent;
      return "Можно в сопровождении взрослых";
    } else {
      _permissionColor = Colors.greenAccent;
      return "Вам можно на этот фильм";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 5: Checking age'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Введите свой возраст"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: (String age) {
                setState(() {
                  _permission = _getPermission(int.parse(age));
                });
              },
            ),
            Container(
              height: 50,
            ),
            Container(
              child: Center(
                child: Text(
                  _permission,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              color: _permissionColor,
              height: 40,
              width: 360,
            ),
          ],
        ),
      ),
    );
  }
}
