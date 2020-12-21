import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(433, 894), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/doctorpage.png"),
            Container(
              height: 555.h,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: 173.h,
                          width: 350.w,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25.h,
                                left: 16.w,
                                child: Text(
                                  "Veterinary RK ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.robotoCondensed(
                                      textStyle: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                      color: Colors.blue),
                                ),
                              ),
                              Positioned(
                                top: 70.h,
                                left: 16.w,
                                child: Text(
                                  "Mattancherry ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.robotoCondensed(
                                      textStyle: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18),
                                      color: Colors.blue),
                                ),
                              ),
                              Positioned(
                                  top: 70.h,
                                  right: 60.w,
                                  child: Card(
                                    elevation: 2,
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  )),
                              Positioned(
                                  bottom: 30.h,
                                  left: 20.w,
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              Positioned(
                                  bottom: 30.h,
                                  left: 40.w,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
