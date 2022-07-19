// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('https://codingapple1.github.io/app/car0.png'),
              Text('like 100'),
              Text('Editor'),
              Text('Contents'),
            ],
          );
        });
  }
}
