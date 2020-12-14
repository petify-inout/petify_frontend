import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: Image.asset('assets/homepage.jpg'),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 433.w,
              height: 60.h,
              color: Color(0xff154a63),
              child: Center(
                  child: Text(
                'What\'s bothering your pet?',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              height: 60.h,
              width: 170.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff154a63),
              ),
              child: Center(
                  child: Text(
                'Choose your pet',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ),
            SizedBox(
              height: 40.h,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Container(
                        height: 60, child: Image.asset('assets/dog.jpg')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Container(
                        height: 60, child: Image.asset('assets/cat.jpg')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Container(
                        height: 60, child: Image.asset('assets/rat.png')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Container(
                        height: 60, child: Image.asset('assets/horse.jpg')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Container(
                        height: 60, child: Image.asset('assets/parrot.jpg')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 433.w,
              height: 60.h,
              color: Color(0xff154a63),
              child: Center(
                  child: Text(
                'Consult a Professional',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ),
            Container(
              width: 433.w,
              height: 60.h,
              color: Color(0xff154a63),
              child: Center(
                  child: Text(
                'View Previous Predictions',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ),
            Container(
              width: 433.w,
              height: 60.h,
              color: Color(0xff154a63),
              child: Center(
                  child: Text(
                'View Consultation Info',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
