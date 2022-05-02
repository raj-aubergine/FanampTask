import 'package:flutter/material.dart';
import 'package:internationalization/generated/l10n.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).SecondScreenAppbarText)),
        body: Center(child: Text(S.of(context).SecondScreenCenter)));
  }
}
