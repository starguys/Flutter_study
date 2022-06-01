import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      print(contacts[0].familyName);
      name = contacts;
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }

  var name = [];

  addName(a) {
    setState(() {
      name.add(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('연락처앱'),
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts))
        ],
      ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (c, i) {
            return ListTile(title: Text(name[i].familyName));
          }),
      floatingActionButton: FloatingActionButton(
        child: Text('OK'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(addName: addName);
              });
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addName}) : super(key: key);

  final addName;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: inputData,
            ),
            TextButton(
                onPressed: () {
                  addName(inputData.text);
                  Navigator.pop(context);
                },
                child: Text('완료')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소'))
          ],
        ),
      ),
    );
  }
}
