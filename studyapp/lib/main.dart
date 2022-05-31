import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('버튼'),
        onPressed: () {
          print(a);
          a++;
        },
      ),
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (c, i) {
            return Text(i.toString());
          }),
    ));
  }
}
