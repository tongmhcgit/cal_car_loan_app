// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //เช็คค่าเพื่อใช้กำหนดรูปแบบตัวเลขมี comma
  var nf = NumberFormat('###,##0.00',"en_US");

  TextEditingController _carpriceCtrl = TextEditingController(text: '');
  TextEditingController _interestCtrl = TextEditingController(text: '');

  String? _downPay = "10";
  String? _SelectYearPay = "1";

  List<DropdownMenuItem<String>> get _dropdownItemsYearPay {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "1",
        child: Text("12 งวด (1 ปี)"),
      ),
      DropdownMenuItem(
        value: "2",
        child: Text("24 งวด (2 ปี)"),
      ),
      DropdownMenuItem(
        value: "3",
        child: Text("36 งวด (3 ปี)"),
      ),
      DropdownMenuItem(
        value: "4",
        child: Text("48 งวด (4 ปี)"),
      ),
      DropdownMenuItem(
        value: "5",
        child: Text("60 งวด (5 ปี)"),
      ),
      DropdownMenuItem(
        value: "6",
        child: Text("72 งวด (6 ปี)"),
      ),
      DropdownMenuItem(
        value: "7",
        child: Text("84 งวด (7 ปี)"),
      ),
    ];
    return menuItems;
  }

  //เมธอดแสดง warning dialog

  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Colors.deepOrange,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  //เมธอตแสดงผลลับ
  _showResultDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'ยอดผ่อนรถต่อเดือน',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Colors.deepOrange,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.kanit(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'คำนวนค่างวดรถ',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              CircleAvatar(
                backgroundColor: Colors.deepOrange,
                radius: MediaQuery.of(context).size.width * 0.21,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 231, 251, 241),
                  radius: MediaQuery.of(context).size.width * 0.19,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.18,
                    backgroundImage: AssetImage(
                      'assets/images/car.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคารถ (บาท)',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: TextField(
                  controller: _carpriceCtrl,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.kanit(
                    color: Colors.grey[700],
                  ),
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle: GoogleFonts.kanit(),
                    suffixText: 'บาท',
                    suffixStyle: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เงินดาวน์ (%)',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downPay = data;
                      });
                    },
                    value: "10",
                    groupValue: _downPay,
                    activeColor: Colors.deepOrange,
                  ),
                  Text(
                    "10%",
                    style: GoogleFonts.kanit(),
                  ),
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downPay = data;
                      });
                    },
                    value: "20",
                    groupValue: _downPay,
                    activeColor: Colors.deepOrange,
                  ),
                  Text(
                    "20%",
                    style: GoogleFonts.kanit(),
                  ),
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downPay = data;
                      });
                    },
                    value: "25",
                    groupValue: _downPay,
                    activeColor: Colors.deepOrange,
                  ),
                  Text(
                    "25%",
                    style: GoogleFonts.kanit(),
                  ),
                  Radio(
                    onChanged: (data) {
                      setState(() {
                        _downPay = data;
                      });
                    },
                    value: "30",
                    groupValue: _downPay,
                    activeColor: Colors.deepOrange,
                  ),
                  Text(
                    "30%",
                    style: GoogleFonts.kanit(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนปีที่ผ่อน',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: _dropdownItemsYearPay,
                      value: _SelectYearPay,
                      onChanged: (String? value) {
                        setState(() {
                          _SelectYearPay = value;
                        });
                      },
                      style: GoogleFonts.kanit(
                        color: Colors.grey[700],
                      ),
                      iconEnabledColor: Colors.grey[700],
                      dropdownColor: Colors.deepOrange[50],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ดอกเบี้ย(%)ต่อปี',
                    style: GoogleFonts.kanit(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: TextField(
                  controller: _interestCtrl,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.kanit(
                    color: Colors.grey[700],
                  ),
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle: GoogleFonts.kanit(),

                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  //validate ตรวจสอบ หน้าจอว่าป้อนครบหรือยัง
                  if (_carpriceCtrl.text.isEmpty == true){
                    _showWarningDialog(context, "ป้อนราคารถด้วย");
                  }else if(_interestCtrl.text.isEmpty == true){
                    _showWarningDialog(context, "ป้อนดอกเบี้ย(%)ต่อปีด้วย...");
                    
                  }else{
                    //พร้อมคำนวน โดยเริ่มจาก คำนวนเงินดาวน์
                    //คำนวนเงินดานว์
                    //แปลงราคาที่ป้อนจากข้อความให้เป็นตัวเลข
                    double carPrice = double.parse(_carpriceCtrl.text);
                    //แปลงเงินดาวน์ % ให้เป็นตัวเลข
                    int downPay = int.parse(_downPay!);
                    //คำนวนเงินดาวน์
                    double moneyDownPay = carPrice * downPay / 100;
                    //คำนวนยอดจัดs
                    double carPriceForCal = carPrice - moneyDownPay;
                    //คำนวนดอกเบี้ยต่อปี = ยอดจัด * ดอกเบี้ย(%) / 100;
                    double interest = double.parse(_interestCtrl.text);
                    double moneyInterest = carPriceForCal * interest / 100;
                    //คำนวนดอกเบี้ยตามจำนวนปีที่ผ่อน = ดอกเบี้ย * จำนวนปีที่ผ่อน
                    //แปลจำนวนปี ให้เป็นตัวเลข
                    int yearPay = int.parse(_SelectYearPay!);
                    double moneyInterestTotal = moneyInterest * yearPay;
                    //คำนวนเงินที่จะนำไปคิดยอดผ่อน = ยอดจัด + ดอกเบี้ยตามจำนวนปีที่ผ่อน
                    double carPriceTotal = carPriceForCal + moneyInterestTotal;
                    //คำนวนเงินที่จะผ่อนต่อเดือน = เงินที่จะต้องนำไปคิดยอดผ่อน / (จำนวนปีที่ผ่อน * 12)
                    double carMoneyPayPerMouth = carPriceTotal / (yearPay * 12);
                    //แสดงผล ราคารถ เงินดาวน์ จำนวนเดือนที่ผ่อน และเงินที่ผ่อนต่อเดือน เป็นไดอะล็อก
                    String msgShow = "รถราคา ${nf.format (carPrice) } บาท\n" ;
                    msgShow += "ดาวน์${downPay}% เป็นเงิน ${nf.format (moneyDownPay)} บาท\n";
                    msgShow += "จำนวนเดือนผ่อน${yearPay * 12} เดือน\n" ;
                    msgShow += "ค่าผ่อนต่อเดือน ${nf.format (carMoneyPayPerMouth)} บาท" ;
                    _showResultDialog(context, msgShow);

                  
                  }
                },
                child: Text(
                  'คำนวนค่างวดรถ',
                  style: GoogleFonts.kanit(),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
