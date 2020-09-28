import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class myheader extends StatelessWidget {
  final String image;
  final String texttop;
  final String textbottom;
  const myheader({
    Key key,
    this.image,
    this.texttop,
    this.textbottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: myclipper(),
      child: Container(
        padding: EdgeInsets.only(top: 30, right: 20),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF3383CD), Color(0xFF11249FF)]),
            image:
                DecorationImage(image: AssetImage("assets/covid19/virus.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset("assets/icons/menu.svg")),
            Expanded(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    image,
                    width: 200,
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                      left: 150,
                      child: Text(
                        "$texttop \n $textbottom",
                        style: kHeadingTextStyle.copyWith(color: Colors.white),
                      )),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
