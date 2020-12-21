import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petify/models/resultModel.dart';
import 'package:petify/services.dart/networkUtil.dart';
import 'package:petify/utils.dart/constant.dart';

class ResultPage extends StatefulWidget {
  final List<String> symptoms;
  ResultPage(this.symptoms);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<ResultModel> results = [];
  bool loading = true;
  String otherDisease = "";
  @override
  void initState() {
    getResults();
    super.initState();
  }

  getResults() async {
    Map body = {"symptoms": widget.symptoms};
    var res = await postNetwork(predictUrl, body);
    List<String> temp = [];
    if (res[0]) {
      res[1]["prediction"].forEach((e) {
        results.add(
            ResultModel(disease: e["disease"], probability: e["probability"]));
        temp.add(e["disease"] + "(${e["probability"].toInt()}%)");
      });
      print("got the results:) $results");
      temp.removeAt(0);
      otherDisease = temp.join(",");
      setState(() {
        loading = false;
      });
    } else {
      Fluttertoast.showToast(msg: "Error Try Again");
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(433, 894), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(0xff1888EF),
      body: SafeArea(
        child: loading
            ? Center(
                child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Image.asset("assets/speedresult.png"),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Container(
                      width: 300.w,
                      child: Text(
                        "Your Pet has ${results[0].probability.toInt()}% probabilty of",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Container(
                      width: 300.w,
                      child: Text(
                        "${results[0].disease.toUpperCase()}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Center(
                    child: Container(
                      width: 300.w,
                      child: Text(
                        "Other possible diseases :",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Container(
                      width: 300.w,
                      child: Text(
                        "$otherDisease",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        child: Center(
                          child: Text(
                            "Scan Again",
                            style: GoogleFonts.robotoCondensed(
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                color: Colors.blue),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        height: 58.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(0, 8),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 2),
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}
