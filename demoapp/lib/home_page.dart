import 'dart:convert';

import 'package:demoapp/models/datamodel.dart';
import 'package:demoapp/widgets/custom_expansion_tile.dart';
import 'package:demoapp/provider/expansionProvider.dart';
import 'package:demoapp/widgets/team_names_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<List<DataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => DataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    // ExpansionProvider provider = Provider.of<ExpansionProvider>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        appBar: AppBar(
          title: const Text("DEMO APP"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<DataModel>;
                    return ListView.builder(
                        //    Key('builder ${provider.getSelected.toString()}'),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Consumer<ExpansionProvider>(
                              builder: (context, provider, _) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CustomExpansionTile(
                                  title: items[index].title,
                                  point: items[index].point,
                                  children: [
                                    TeamNamesCard(),
                                  ],
                                  key: Key(index.toString()),
                                  initiallyExpanded:
                                      index == provider.getSelected,
                                  //maintainState: true,
                                  onExpansionChanged: ((newState) {
                                    Future.delayed(
                                        const Duration(milliseconds: 000), () {
                                      if (newState = true) {
                                        provider.changeExpansion(index);
                                      }
                                    });
                                  })),
                            );
                          });
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ));
  }
}
