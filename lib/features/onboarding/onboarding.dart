import 'package:flutter/material.dart';

import 'package:cuit/features/onboarding/features_items.dart';
import 'package:cuit/features/onboarding/feature_item.dart';
import 'package:cuit/features/onboarding/indicator.dart';
import 'package:cuit/widgets/logo.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLast = currentPage == 3;

    return Scaffold(body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Logo(),
                      isLast
                          ? SizedBox()
                          : TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Color(0xFFF0F0F0))),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/signup'),
                              child: Text(
                                'Lewati',
                                style: TextStyle(
                                    color: const Color(0xFF222222),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              )),
                    ],
                  )),
              Container(
                  height: 530.0,
                  child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: featureItems.length,
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return FeatureItem(
                            title: featureItems[index]["title"],
                            description: featureItems[index]["description"],
                            image: featureItems[index]["image"]);
                      })),
              SizedBox(
                  width: 180.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      featureItems.length,
                      (int index) => Indicator(isActive: currentPage == index),
                    ),
                  )),
              Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: isLast
                          ? () => Navigator.pushNamed(context, '/signup')
                          : () => _controller.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn),
                      child: Text(
                        isLast ? "Memulai" : "Selanjutnya",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )))
            ],
          ));
    })));
  }
}
