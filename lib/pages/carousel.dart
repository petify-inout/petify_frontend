import 'package:petify/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  Widget carousel(image, text, _current) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 174.h,
          ),
          Container(height: 413.h, width: 347.w, child: Image.asset(image)),
          SizedBox(
            height: 40.h,
          ),
          Text(text,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                  textStyle:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 80.h,
          ),
          Container(
            height: 50,
            width: 50,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _current == index ? Colors.redAccent : Colors.green,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(433, 894), allowFontScaling: false);
    return Scaffold(
      body: PageView(
        onPageChanged: (page) {
          if (page == 3) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          }
        },
        children: [
          carousel("assets/carousel1.png",
              "A VIRTUAL SPACE FOR COMPLETE PET HEALTH CARE", 0),
          carousel("assets/carousel2.png",
              "Find your pet’s ailments by choosing their symptoms", 1),
          carousel(
              "assets/carousel3.png", "find pet proffessionals near you", 2),
          Container()
        ],
      ),
    );
  }
}
