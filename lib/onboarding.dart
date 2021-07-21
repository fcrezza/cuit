import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final Widget logo = SvgPicture.asset('assets/images/logo.svg');
  final List<Map<String, String>> items = [
    {
      "title": "Selamat datang!",
      "description": "Disini kamu bisa berdiskusi hal menarik seputar kehidupan mahasiswa.",
      "image": "assets/images/hands.svg"
    },
    {
      "title": "Saling terhubung",
      "description": "Berpartisipasi dalam diskusi membahas topik dan hal menarik.",
      "image": "assets/images/discuss.svg"
    },
    {
      "title": "Bagikan Tulisanmu",
      "description": "Mulai dan tulis diskusi terkait topik yang membuat kamu tertarik.",
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

 void handlePageChange(value) {
   setState(() {
     currentPage = value;
   });
 }

  @override
  Widget build(BuildContext context) {
    bool isLast = currentPage == 3;

    return Scaffold(
      body: SafeArea(child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                logo,
                isLast ?
                SizedBox() :
                    TextButton(
                      style: ButtonStyle(overlayColor: MaterialStateProperty.all(Color(0xFFF0F0F0))),
                        onPressed: () {},
                        child:
                        Text('Lewati',
                          style: TextStyle(
                              color: const Color(0xFF222222),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                          ),)
                    ),
              ],)
            ),
      Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: items.length,
              onPageChanged: handlePageChange,
              itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180.0,
                  child: SvgPicture.asset(items[index]["image"]),
                ),
                SizedBox(height: 24.0,),
                Text(
                    items[index]["title"],
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline1.color,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0
                    )),
                SizedBox(height: 10.0,),
                Text(
                    items[index]["description"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 16.0
                    )),
              ],
            );
          })),
            SizedBox(
              width: 180.0,
              child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      items.length,
                          (int index) => indicator(index),
                    ),
                  )
            ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed:
          isLast ?
              () {} :
              () => _controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn),
          child: Text(
            isLast ? "Memulai" : "Selanjutnya",
            style: TextStyle(fontWeight: FontWeight.w700),
          ))
      )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AnimatedContainer indicator(index) {
   return AnimatedContainer(
       duration: new Duration(milliseconds: 200),
     height: 5.0,
     width: 40.0,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.all(
           Radius.circular(10),
         ),
         color: currentPage == index ? const Color(0xFF888888) : const Color(0xFFF0F0F0)
     ),
   );
  }
}