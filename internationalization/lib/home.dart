import 'package:flutter/material.dart';
import 'package:internationalization/change_language_provider.dart';
import 'package:internationalization/generated/l10n.dart';
import 'package:internationalization/second_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var myMenuItems = <String>[
    'English',
    'Hindi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appbartext),
        actions: <Widget>[
          PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return myMenuItems.map((String choice) {
              return PopupMenuItem<String>(
                child: Text(choice),
                value: choice,
              );
            }).toList();
          }, onSelected: (item) {
            switch (item) {
              case 'English':
                context.read<ChangeLanguageProvider>().changeLocale("en");
                break;
              case 'Hindi':
                context.read<ChangeLanguageProvider>().changeLocale("hi");
                break;
            }
          })
        ],
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => SecondScreen())));
        },
        child: Text(S.of(context).buttontext),
      )),
    );
  }
}
