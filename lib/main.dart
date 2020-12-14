import 'package:petify/pages/carousel.dart';
import 'package:petify/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petify',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;

  Widget page = new Container(
    height: 100,
    width: 50,
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    super.initState();
    initialPage();
  }

  initialPage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool onboarding = sharedPreferences.getBool('onboarding');

    if (onboarding == null || !onboarding) {
      sharedPreferences.setBool('onboarding', true);
      setState(() {
        page = new Carousel();
      });
    }
    if (onboarding) {
      sharedPreferences.setBool('onboarding', true);
      setState(() {
        page = new HomePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(414, 896), allowFontScaling: false);
    return page;
  }
}
