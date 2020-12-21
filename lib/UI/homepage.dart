import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petify/UI/symptomSearch.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(433, 894), allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: Image.asset('assets/homepage.png'),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // SizedBox(
              //   height: 25.h,
              // ),
              Container(
                width: 433.w,
                height: 60.h,
                color: Color(0xff1888EF),
                child: Center(
                    child: Text('Choose Your Pet',
                        style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                        ))),
              ),
              SizedBox(
                height: 25.h,
              ),
              // Container(
              //   height: 60.h,
              //   width: 170.w,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Color(0xff154a63),
              //   ),
              //   child: Center(
              //       child: Text(
              //     'Choose your pet',
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   )),
              // ),
              SizedBox(
                height: 40.h,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SymptomPage();
                          }));
                        },
                        child: Container(
                            height: 100, child: Image.asset('assets/dog.jpg')),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Currently only supports Dogs');
                        },
                        child: Container(
                            height: 80, child: Image.asset('assets/cat.jpg')),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Currently only supports Dogs');
                        },
                        child: Container(
                            height: 80, child: Image.asset('assets/rat.png')),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Currently only supports Dogs');
                        },
                        child: Container(
                            height: 80, child: Image.asset('assets/horse.jpg')),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Currently only supports Dogs');
                        },
                        child: Container(
                            height: 80,
                            child: Image.asset('assets/parrot.jpg')),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
