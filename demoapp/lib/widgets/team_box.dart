import 'package:flutter/material.dart';

class TeamBoxLeft extends StatelessWidget {
  const TeamBoxLeft(
      {Key? key, required this.id, required this.logo, required this.name})
      : super(key: key);
  final int id;
  final String logo;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(children: [
          SizedBox(
            width: 25,
            child: Text(id.toString(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Container(
            width: 145,
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(
                color: Colors.black,
                width: 3,
              ),
              top: BorderSide(
                color: Colors.black,
                width: 3,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 3,
              ),
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.album),
                  const SizedBox(width: 2),
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15)),
                ],
              ),
            ),
          ),
        ]));
  }
}

class TeamBoxRight extends StatelessWidget {
  const TeamBoxRight(
      {Key? key, required this.id, required this.logo, required this.name})
      : super(key: key);
  final int id;
  final String logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(children: [
          Container(
            width: 145,
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(
                color: Colors.black,
                width: 3,
              ),
              top: BorderSide(
                color: Colors.black,
                width: 3,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 3,
              ),
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15)),
                  const SizedBox(width: 2),
                  const Icon(Icons.album),
                ],
              ),
            ),
          ),
          const SizedBox(width: 2),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 25,
              child: Text(id.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ]),
        ]));
  }
}
