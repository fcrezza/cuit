import 'package:flutter/material.dart';

import 'package:cuit/widgets/logo.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Map<String, String>> featureItems = const [
    {
      "title": "Selamat datang!",
      "description":
          "Disini kamu bisa berdiskusi hal menarik seputar kehidupan mahasiswa.",
      "image": "assets/images/hands.svg"
    },
    {
      "title": "Saling terhubung",
      "description":
          "Berpartisipasi dalam diskusi membahas topik dan hal menarik.",
      "image": "assets/images/discuss.svg"
    },
    {
      "title": "Bagikan Tulisanmu",
      "description":
          "Mulai dan tulis diskusi terkait topik yang membuat kamu tertarik.",
      "image": "assets/images/broadcast.svg"
    },
    {
      "title": "Mulai diskusi sekarang!",
      "description": "Bergabung untuk memulai",
      "image": "assets/images/rocket.svg"
    },
  ];
  final _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isLast = currentPage == 3;

    return Scaffold(body: SafeArea(child:
        LayoutBuilder(builder: (BuildContext context, viewportConstraints) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
                child: Text(
                    'lol')), // This trailing comma makes auto-formatting nicer for build methods.
          ));
    })));
  }
}

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

class Indicator extends StatelessWidget {
  final bool isActive;

  Indicator({this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: new Duration(milliseconds: 200),
      height: 5.0,
      width: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: isActive ? const Color(0xFF888888) : const Color(0xFFF0F0F0)),
    );
  }
}
