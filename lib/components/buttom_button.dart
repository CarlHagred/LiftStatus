import 'package:flutter/material.dart';
import '../constant.dart';

const double buttomContainerHeight = 80;

class ButtomButton extends StatelessWidget {
  final Function onTap;
  final String title;

  ButtomButton({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLartbuttonText,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        color: Colors.grey,
        padding: EdgeInsets.only(bottom: 20),
        height: buttomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
