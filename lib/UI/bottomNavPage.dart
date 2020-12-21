import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petify/UI/doctorPage.dart';
import 'package:petify/UI/homepage.dart';
import 'package:petify/UI/petCarePage.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  PageController pageController = PageController(initialPage: 1);
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(433, 894), allowFontScaling: false);
    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          children: [Doctors(), HomePage(), PetCare()],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Color(0xff1888EF)),
          height: 76.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Container(
                    height: 76.h,
                    color: currentPage == 0 ? Colors.blue : Color(0xff1888EF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 40,
                            child: Image.asset('assets/icondoctor.png')),
                        Center(
                            child: Text('Doctors',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(1);
                  },
                  child: Container(
                    height: 76.h,
                    color: currentPage == 1 ? Colors.blue : Color(0xff1888EF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 40,
                            child: Image.asset('assets/iconhome.png')),
                        Center(
                            child: Text('Home',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(2);
                  },
                  child: Container(
                    height: 76.h,
                    color: currentPage == 2 ? Colors.blue : Color(0xff1888EF),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 40,
                            child: Image.asset('assets/iconcare.png')),
                        Center(
                            child: Text('Pet Care',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
