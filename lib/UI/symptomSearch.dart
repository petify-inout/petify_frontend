import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petify/UI/resultPage.dart';
import 'package:petify/models/symptomsModel.dart';
import 'package:petify/services.dart/networkUtil.dart';
import 'package:petify/utils.dart/constant.dart';

class SymptomPage extends StatefulWidget {
  @override
  _SymptomPageState createState() => _SymptomPageState();
}

class _SymptomPageState extends State<SymptomPage> {
  List<SymptomsModel> symptoms = [];
  GlobalKey<AutoCompleteTextFieldState<SymptomsModel>> key = new GlobalKey();
  AutoCompleteTextField searchTextField;
  List<String> selectedSym = [];
  bool loading = true;

  @override
  void initState() {
    getSymptoms();

    super.initState();
  }

  getSymptoms() async {
    var res = await getNetwork(symptomUrl);
    if (res[0]) {
      print('result is ${res[1]['symptoms']}');
      res[1]['symptoms'].forEach((symptom) {
        symptoms.add(SymptomsModel(symptom));
      });
      print(symptoms);
    } else {
      Fluttertoast.showToast(msg: 'Failed to retrieve symptoms');
    }
    setState(() {
      loading = false;
    });
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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Symptoms',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Color(0xff1596B2))),
                      child: AutoCompleteTextField<SymptomsModel>(
                        key: key,
                        clearOnSubmit: true,
                        suggestions: symptoms,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Color(0xff0913F8),
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                          hintText: "Search for the symptoms",
                          hintStyle:
                              GoogleFonts.robotoCondensed(color: Colors.grey),
                        ),
                        itemFilter: (item, query) {
                          return item.symptom
                              .toLowerCase()
                              .startsWith(query.toLowerCase());
                        },
                        itemSorter: (a, b) {
                          return a.symptom.compareTo(b.symptom);
                        },
                        itemSubmitted: (item) {
                          setState(() {
                            selectedSym.add(item.symptom);
                          });
                          print('dddddddddddddddddddddddd');
                          print(selectedSym);
                        },
                        itemBuilder: (context, item) {
                          // ui for the autocompelete row
                          return row(item);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                        children: selectedSym
                            .map((e) => Padding(
                                  padding:
                                      EdgeInsets.only(right: 8.0, bottom: 8),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 160, minWidth: 100),
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xff1888EF),
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 120),
                                            child: Text(
                                              e,
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color: Color(0xff0E4579),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedSym.removeWhere(
                                                      (element) =>
                                                          element == e);
                                                });
                                              },
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()
                            .cast<Widget>()),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  Center(child: Image.asset("assets/dog_searchpage.png"))
                ],
              ),
            ),
      floatingActionButton: GestureDetector(
        onTap: () {
          if (selectedSym.length > 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(selectedSym);
            }));
          } else {
            Fluttertoast.showToast(msg: "PLease Select More Than 2 ");
          }
        },
        child: Container(
          child: Center(
            child: Text(
              "PREDICT",
              style: GoogleFonts.robotoCondensed(
                  textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          height: 58.h,
          width: 151.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 8),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey, width: 2),
              color: Color(0xff1888EF)),
        ),
      ),
    );
  }

  Widget row(SymptomsModel item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        item.symptom,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
