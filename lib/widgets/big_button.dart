import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryGradientColor;
  final Color secondaryGradientColor;
  final Function onPress;

  const BigButton({
    Key? key,
    required this.icon,
    required this.text,
    this.primaryGradientColor = Colors.blue,
    this.secondaryGradientColor = Colors.blueAccent,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onPress(),
      child: Stack(
        children: [
          _BigButtonBackground(
            icon: this.icon,
            primaryGradientColor: this.primaryGradientColor,
            secondaryGradientColor: this.secondaryGradientColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(
                  child: Text(this.text,
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight,
                  color: Colors.white, size: 40),
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _BigButtonBackground extends StatelessWidget {
  final Color primaryGradientColor;
  final Color secondaryGradientColor;
  final IconData icon;

  const _BigButtonBackground(
      {Key? key,
      required this.primaryGradientColor,
      required this.secondaryGradientColor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
            right: -20,
            top: -20,
            child: FaIcon(this.icon,
                size: 150, color: Colors.white.withOpacity(0.2)),
          )
        ]),
      ),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(4, 6),
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            this.primaryGradientColor,
            this.secondaryGradientColor,
          ])),
    );
  }
}
