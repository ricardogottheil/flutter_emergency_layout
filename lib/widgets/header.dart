import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primaryGradientColor;
  final Color secondaryGradientColor;

  const IconHeader({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.primaryGradientColor = Colors.grey,
    this.secondaryGradientColor = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _IconHeaderBackground(
        primaryGradientColor: primaryGradientColor,
        secondaryGradientColor: secondaryGradientColor,
      ),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon,
              color: Colors.white.withOpacity(0.2), size: 250)),
      Column(children: <Widget>[
        SizedBox(height: 80, width: double.infinity),
        Text(this.subtitle,
            style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(height: 20),
        Text(this.title,
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        FaIcon(this.icon, color: Colors.white, size: 80)
      ])
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color primaryGradientColor;
  final Color secondaryGradientColor;

  const _IconHeaderBackground({
    Key? key,
    required this.primaryGradientColor,
    required this.secondaryGradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                this.primaryGradientColor,
                this.secondaryGradientColor,
              ])),
    );
  }
}
