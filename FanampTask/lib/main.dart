import 'package:demoapp/provider/expansionProvider.dart';
import 'package:demoapp/widgets/track_details.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ExpansionProvider(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: TrackDetails(),
      ),
    );
  }
}
