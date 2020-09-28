import 'package:covid/constant.dart';
import 'package:covid/info_screen.dart';
import 'package:covid/widget/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid19',
        theme: ThemeData(
          textTheme: TextTheme(
              body1: TextStyle(color: kBodyTextColor, fontFamily: "Poppins")),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: infoscreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                myheader(
                  image: "assets/icons/Drcorona.png",
                  texttop: "All you Need",
                  textbottom: "is stay at home",
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE5E5E5)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                        SizedBox(width: 20),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              value: "turkey",
                              items: [
                                "turkey",
                                "USA",
                                "Germany"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    value,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Case Update\n",
                                  style: kTitleTextstyle),
                              TextSpan(
                                  text: "Newest Update March28",
                                  style: TextStyle(color: kTextLightColor))
                            ]),
                          ),
                          Spacer(),
                          Text(
                            "See Details",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 40,
                                  color: kShadowColor)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Counter(
                              color: kInfectedColor,
                              number: 1046,
                              title: "Enfekte",
                            ),
                            Counter(
                              color: kDeathColor,
                              number: 1046,
                              title: "Ölüm",
                            ),
                            Counter(
                              color: kRecovercolor,
                              number: 1046,
                              title: "İyileşen",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Virüs Yayılımı",
                            style: kTitleTextstyle,
                          ),
                          Text(
                            "Daha fazla",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 20,
                              color: kShadowColor)
                        ]),
                        child: Image.asset(
                          "assets/covid19/map.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
