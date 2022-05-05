import 'dart:convert';

import 'package:demoapp/widgets/custom_list_tile.dart';
import 'package:demoapp/widgets/custom_expansion_tile.dart';
import 'package:demoapp/widgets/team_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrackDetails extends StatefulWidget {
  const TrackDetails({Key? key}) : super(key: key);

  @override
  State<TrackDetails> createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
  //var response;

  Future<List<dynamic>> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/json/data.json');
    List data = json.decode(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(children: [
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Saturday,March 26 at 1:00pm EST",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  )),
              const SizedBox(height: 20),
              CustomExpansionTile(
                title: "Track Details",
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      child: FutureBuilder(
                          future: readJsonData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[0]["trackName"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                      child: Image.asset(
                                          'assets/images/${snapshot.data[0]["trackImage"]}',
                                          width: 400,
                                          height: 200)),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Laps",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 5,
                                          child: Text(
                                            snapshot.data[0]["Laps"],
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            "DRS Zones",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 5,
                                          child: Text(
                                            snapshot.data[0]["DrsZones"],
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Record",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 5,
                                          child: Text(
                                            snapshot.data[0]["Record"],
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ))
                                    ],
                                  )
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })),
                ],
              ),
              const SizedBox(height: 20),
              CustomExpansionTile(title: "Teams", children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SvgPicture.asset("assets/images/Group 1595.svg",
                        width: queryData.size.width - 20)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                              future: readJsonData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.data[0]["teams"].length,
                                      itemBuilder: (context, index) {
                                        return ((int.parse(snapshot.data[0]
                                                            ["teams"][index]
                                                        ["teamposition"]) %
                                                    2) !=
                                                0)
                                            ? TeamBoxLeft(
                                                id: int.parse(snapshot.data[0]["teams"]
                                                    [index]["teamposition"]),
                                                name: snapshot.data[0]["teams"]
                                                    [index]["teamname"],
                                                logo: snapshot.data[0]["teams"]
                                                    [index]["teamlogo"])
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 50),
                          FutureBuilder(
                              future: readJsonData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.data[0]["teams"].length,
                                      itemBuilder: (context, index) {
                                        return ((int.parse(snapshot.data[0]
                                                            ["teams"][index]
                                                        ["teamposition"]) %
                                                    2) ==
                                                0)
                                            ? TeamBoxRight(
                                                id: int.parse(snapshot.data[0]["teams"]
                                                    [index]["teamposition"]),
                                                name: snapshot.data[0]["teams"]
                                                    [index]["teamname"],
                                                logo: snapshot.data[0]["teams"]
                                                    [index]["teamlogo"])
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
                  ]),
                )
              ]),
              const SizedBox(height: 20),
              CustomExpansionTile(
                title: "Point awards",
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                      child: FutureBuilder(
                          future: readJsonData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Constructors",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 60, 0)),
                                  ),
                                  const SizedBox(height: 20),
                                  Column(
                                    children: [
                                      Row(children: const [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Pos.",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "Team",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Pts.",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              snapshot.data[0]["teams"].length,
                                          itemBuilder: (context, index) {
                                            return CustomListTile(
                                              last: snapshot.data[0]["teams"]
                                                  [index]["teampoints"],
                                              first: snapshot.data[0]["teams"]
                                                  [index]["teamposition"],
                                              titlelogo: snapshot.data[0]
                                                  ["teams"][index]["teamlogo"],
                                              title: snapshot.data[0]["teams"]
                                                  [index]["teamname"],
                                            );
                                          })
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Drivers",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 60, 0)),
                                  ),
                                  const SizedBox(height: 20),
                                  Column(
                                    children: [
                                      Row(children: const [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Pos.",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            "Driver",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Nat.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Pts.",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: snapshot
                                              .data[0]["Results"].length,
                                          itemBuilder: (context, index) {
                                            return CustomListTile(
                                              last: snapshot.data[0]["Results"]
                                                  [index]["points"],
                                              first: snapshot.data[0]["Results"]
                                                  [index]["position"],
                                              titlelogo: snapshot.data[0]
                                                      ["Results"][index]
                                                  ["teamlogo"],
                                              title: snapshot.data[0]["Results"]
                                                  [index]["driver"],
                                              third: snapshot.data[0]["Results"]
                                                  [index]["nationalityFlag"],
                                            );
                                          })
                                    ],
                                  )
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }))
                ],
              ),
              const SizedBox(height: 20),
              CustomExpansionTile(
                title: "Results",
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: FutureBuilder(
                        future: readJsonData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 230,
                                  child: Stack(children: [
                                    Positioned(
                                      top: 150,
                                      child: SvgPicture.asset(
                                        'assets/images/Group 1456.svg',
                                        width: queryData.size.width - 40,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: queryData.size.width / 40,
                                      child: Container(
                                          width: 110,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(children: [
                                              Image.asset(
                                                  'assets/images/driver.png'),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Max Verstappen",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ]),
                                          )),
                                    ),
                                    Positioned(
                                      left: queryData.size.width / 3.2,
                                      top: 20,
                                      child: Container(
                                          width: 110,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(children: [
                                              Image.asset(
                                                  'assets/images/driver.png'),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Max Verstappen",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ]),
                                          )),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 43,
                                      child: Container(
                                          width: 110,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(children: [
                                              Image.asset(
                                                  'assets/images/driver.png'),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Carloz Sainz",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ]),
                                          )),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: const [
                                      Expanded(child: Text("1:24:19.293")),
                                      Expanded(child: Text("+0.549s")),
                                      Expanded(child: Text("+8.097s"))
                                    ],
                                  ),
                                ),
                                Stack(children: [
                                  Positioned(
                                    top: 83,
                                    child: SvgPicture.asset(
                                      "assets/images/Subtract.svg",
                                      width: queryData.size.width - 40,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 110,
                                    left: 15,
                                    child: Text(
                                      "Fastest\nLap",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 100),
                                            Container(
                                                width: 110,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 20, 20, 10),
                                                  child: Column(children: [
                                                    Image.asset(
                                                        'assets/images/${snapshot.data[0]["fastestlap"]["driverimage"]}'),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      snapshot.data[0]
                                                              ["fastestlap"]
                                                          ["driver"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ]),
                                                )),
                                            const SizedBox(width: 20),
                                            Container(
                                                width: 110,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 20, 20, 10),
                                                  child: Column(children: [
                                                    Image.asset(
                                                        'assets/images/${snapshot.data[0]["fastestlap"]["teamlogo"]}'),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      snapshot.data[0]
                                                              ["fastestlap"]
                                                          ["teamname"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ]),
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 100),
                                            const Text("Time",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              width: 120,
                                            ),
                                            Text(
                                                snapshot.data[0]["fastestlap"]
                                                    ["time"],
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 100),
                                            const Text("Avg. Speed",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              width: 65,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                    snapshot.data[0]
                                                            ["fastestlap"]
                                                        ["avgspeedkm"],
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    snapshot.data[0]
                                                            ["fastestlap"]
                                                        ["avgspeedm"],
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                                Stack(children: [
                                  Positioned(
                                    top: 82,
                                    child: SvgPicture.asset(
                                      "assets/images/Subtract1.svg",
                                      width: queryData.size.width - 40,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 100,
                                    left: 15,
                                    child: Text(
                                      "Pole\nPosition",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 100),
                                      Container(
                                          width: 110,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 10),
                                            child: Column(children: [
                                              Image.asset(
                                                  'assets/images/${snapshot.data[0]["poleposition"]["driverimage"]}'),
                                              const SizedBox(height: 5),
                                              Text(
                                                snapshot.data[0]["poleposition"]
                                                    ["driver"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ]),
                                          )),
                                      const SizedBox(width: 20),
                                      Container(
                                          width: 110,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 10),
                                            child: Column(children: [
                                              Image.asset(
                                                  'assets/images/${snapshot.data[0]["poleposition"]["teamlogo"]}'),
                                              Text(
                                                snapshot.data[0]["poleposition"]
                                                    ["teamname"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ]),
                                          )),
                                    ],
                                  ),
                                ]),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    Row(children: const [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Pos.",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          "Driver",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "TIme",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ]),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            snapshot.data[0]["Results"].length,
                                        itemBuilder: (context, index) {
                                          return CustomListTile(
                                            first: snapshot.data[0]["Results"]
                                                [index]["position"],
                                            titlelogo: snapshot.data[0]
                                                ["Results"][index]["teamlogo"],
                                            title: snapshot.data[0]["Results"]
                                                [index]["driver"],
                                            last: snapshot.data[0]["Results"]
                                                [index]["time"],
                                            titleFlexValue: 5,
                                            lastFlexValue: 2,
                                          );
                                        })
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
