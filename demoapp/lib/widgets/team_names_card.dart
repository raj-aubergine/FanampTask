import 'dart:convert';

import 'package:demoapp/models/teamdata.dart';
import 'package:demoapp/widgets/team_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamNamesCard extends StatelessWidget {
  const TeamNamesCard({Key? key}) : super(key: key);
  Future<List<TeamDataModel>> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/teamdata.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => TeamDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            children: [
              FutureBuilder(
                  future: readJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<TeamDataModel>;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ((items[index].id % 2) != 0)
                                ? TeamBoxLeft(
                                    id: items[index].id,
                                    name: items[index].name,
                                    logo: items[index].logo)
                                : Container();
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            SizedBox(height: 40),
            FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<TeamDataModel>;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ((items[index].id % 2) == 0)
                              ? TeamBoxRight(
                                  id: items[index].id,
                                  name: items[index].name,
                                  logo: items[index].logo)
                              : Container();
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        )),
      ],
    );
  }
}
