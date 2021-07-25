import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  FeatureItem({this.image, this.description, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180.0,
          child: SvgPicture.asset(image),
        ),
        SizedBox(
          height: 24.0,
        ),
        Text(title,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline1.color,
                fontWeight: FontWeight.w900,
                fontSize: 24.0)),
        SizedBox(
          height: 10.0,
        ),
        Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontSize: 16.0)),
      ],
    );
  }
}
