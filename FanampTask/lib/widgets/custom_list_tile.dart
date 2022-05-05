import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.first,
      required this.title,
      this.third,
      required this.last,
      required this.titlelogo,
      this.titleFlexValue = 5,
      this.lastFlexValue = 1})
      : super(key: key);
  final String first;
  final String title;
  final String? third;
  final String last;
  final String titlelogo;
  final int titleFlexValue;
  final int lastFlexValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        (third != null)
            ? Row(children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    first,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    flex: titleFlexValue,
                    child: Row(
                      children: [
                        Image.asset("assets/images/$titlelogo",
                            height: 30, width: 30),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/$third",
                          height: 25,
                          width: 25,
                        ),
                      ]),
                ),
                Expanded(
                  flex: lastFlexValue,
                  child: Text(
                    last,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                )
              ])
            : Row(children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    first,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    flex: titleFlexValue,
                    child: Row(
                      children: [
                        Image.asset("assets/images/$titlelogo",
                            height: 30, width: 30),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
                Expanded(
                  flex: lastFlexValue,
                  child: Text(
                    last,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                )
              ])
      ],
    );
  }
}
