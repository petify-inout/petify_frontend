import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:petify/models/scheduleModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetCare extends StatefulWidget {
  @override
  _PetCareState createState() => _PetCareState();
}

class _PetCareState extends State<PetCare> {
  List<String> categoryitems = ["Vaccinate", "HairCut", "DeWorm"];
  String selectedcategory = "Vaccinate";
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  SharedPreferences prefs;
  List<Schedule> list = [];
  TextEditingController descriptionController = TextEditingController();
  bool loading = true;
  @override
  void initState() {
    super.initState();
    openSchedule();
  }

  openSchedule() async {
    setState(() {
      loading = true;
    });
    prefs = await SharedPreferences.getInstance();
    // prefs.remove('schedule');
    String sch = prefs.getString('schedule');
    list = [];
    if (sch != null) {
      var body = json.decode(sch);
      body.forEach((e) {
        list.add(Schedule.fromJson(e));
      });
      setState(() {});
      print('fffffffffffffffffffffffffffffffffffffffffff');
      print(list);
    } else {
      print('uuuuuuuuuuuuuuuuudddddddddddnnnnnnnnnnn');
    }
    setState(() {
      loading = false;
    });
  }

  createSchedule() {
    // if (descriptionController.text.isNotEmpty) {
    Schedule sch = Schedule(
        category: selectedcategory,
        datetime: date,
        time: time,
        description: descriptionController.text);
    descriptionController.clear();
    list.add(sch);
    var lists = [];
    list.forEach((e) {
      lists.add(Schedule().toJson(e));
    });
    String bo = json.encode(lists);
    prefs.setString("schedule", bo);
    openSchedule();
    // } else {
    //   Fluttertoast.showToast(msg: "Enter Description");
    // }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(433, 894), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF4F4F4),
        title: Text(
          'Pet Care Schedule',
          style: GoogleFonts.robotoCondensed(
              textStyle: TextStyle(color: Colors.blue)),
        ),
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
            )
          : SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 230.h,
                        width: 369.w,
                        color: Colors.grey.shade100,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: DropdownButton(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.arrow_drop_down_circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                    dropdownColor: Colors.grey,
                                    style: TextStyle(fontSize: 14),
                                    underline: Container(),
                                    value: selectedcategory,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedcategory = newValue;
                                      });
                                    },
                                    items: categoryitems.map((category) {
                                      return DropdownMenuItem(
                                        child: Container(
                                          child: Text(category),
                                        ),
                                        value: category,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 2,
                                child: Container(
                                    width: 180,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 14.0),
                                      child: TextField(
                                        controller: descriptionController,
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Description",
                                          hintStyle: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ))),
                            Positioned(
                              bottom: 110.h,
                              right: 16,
                              child: GestureDetector(
                                onTap: () async {
                                  var _date = await showDatePicker(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2025),
                                  );

                                  setState(() {
                                    date = _date;
                                  });
                                },
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 85.h,
                                right: 10.h,
                                child: Text(
                                  '${DateFormat.yMMMEd().format(date)}',
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                                bottom: 60.h,
                                left: 10.h,
                                child: GestureDetector(
                                  onTap: () async {
                                    var _time = await showTimePicker(
                                        context: context, initialTime: time);
                                    setState(() {
                                      time = _time;
                                    });
                                  },
                                  child: Text(
                                    '${time.format(context)}',
                                    style: GoogleFonts.robotoCondensed(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Positioned(
                              bottom: 15,
                              right: 11,
                              child: GestureDetector(
                                onTap: createSchedule,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Create Schedule",
                                      style: GoogleFonts.robotoCondensed(
                                          textStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                          color: Colors.white),
                                    ),
                                  ),
                                  height: 45.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(0, 8),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xff1888EF)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  list.isNotEmpty
                      ? Center(
                          child: Text(
                            "Upcoming Schedules",
                            style: GoogleFonts.robotoCondensed(
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                color: Colors.black),
                          ),
                        )
                      : SizedBox.shrink(),
                  list.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: list.length,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  height: 150.h,
                                  width: 369.w,
                                  color: Colors.grey.shade100,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: Container(
                                          width: 110,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                              child: Text(list[index].category,
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                    textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ))),
                                        ),
                                      ),
                                      Positioned(
                                          top: 10,
                                          right: 2,
                                          child: Container(
                                              width: 180,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14.0),
                                                  child: Text(list[index]
                                                      .description)))),
                                      Positioned(
                                        bottom: 30.h,
                                        right: 16,
                                        child: Container(
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 8.h,
                                          right: 10.h,
                                          child: Text(
                                            '${DateFormat.yMMMEd().format(list[index].datetime)}',
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Positioned(
                                          bottom: 60.h,
                                          left: 10.h,
                                          child: GestureDetector(
                                            child: Text(
                                              '${list[index].time.format(context)}',
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : SizedBox.shrink()
                ],
              ),
            ),
    );
  }
}
