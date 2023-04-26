import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  @required
  late dynamic text;
  double width = double.infinity;
  final VoidCallback ontap ;
  Button(this.text, this.width, this.ontap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: [
                  Colors.deepOrangeAccent.shade700,
                  Colors.orange.shade400,
                ]),
          ),
          child: MaterialButton(
            onPressed: ontap,
            child: text,
          ),
        ),
      ],
    );
  }
}
