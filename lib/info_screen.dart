import 'package:covid/constant.dart';
import 'package:covid/widget/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class infoscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myheader(
            image: "assets/icons/coronadr.svg",
            texttop: "get to know",
            textbottom: "about covid19",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Semptomlar",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    symptoms(
                      image: "assets/covid19/headache.png",
                      title: "Baş ağrısı",
                      isActive: true,
                    ),
                    symptoms(
                      image: "assets/covid19/caugh.png",
                      title: "Öksürük",
                      isActive: true,
                    ),
                    symptoms(
                      image: "assets/covid19/fever.png",
                      title: "Yüksek Ateş",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Önlemler",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 156,
                  child: Stack(
                    children: [
                      Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 20,
                                  color: kShadowColor)
                            ]),
                      ),
                      Image.asset(
                        "assets/covid19/wear_mask.png",
                        height: 130,
                      ),
                      Positioned(
                        left: 130,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          height: 156,
                          width: MediaQuery.of(context).size.width - 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maske takınız",
                                style: kTitleTextstyle.copyWith(fontSize: 16),
                              ),
                              Text(
                                "Kalabalık alanlarda maske takmak sizi ve çevrenizdekileri corona riskinden koruyacaktır",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class symptoms extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const symptoms({
    Key key,
    this.isActive = false,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 40,
                    color: kActiveShadowColor)
                : BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
          ]),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
