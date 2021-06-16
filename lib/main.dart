import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:walletui/data.dart';
import 'package:walletui/widgets/header.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular'),
  );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: const WalletHeader(),
          ),
          const Expanded(child: NewCardSection()),
          Expanded(child: ExpenseSection())
        ],
      ),
    );
  }
}

class NewCardSection extends StatelessWidget {
  const NewCardSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text('Selected Card',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,i){
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              decoration: BoxDecoration(color: primaryColor,boxShadow: customShadow,borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Positioned.fill(
                          top: 150,
                          bottom: -200,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.blue[900]!.withOpacity(0.2),
                                  blurRadius: 50,
                                  spreadRadius: 2,
                                  offset: Offset(20, 0)),
                                   BoxShadow(
                                  color: Colors.white12,
                                  blurRadius: 0,
                                  spreadRadius: -2,
                                  offset: Offset(0, 0)),
                            ], shape: BoxShape.circle, color: Colors.white30),
                          ),
                        ),
                        Positioned.fill(
                          top: -100,
                          bottom: -100,
                          left: -300,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.blue[900]!.withOpacity(0.2),
                                  blurRadius: 50,
                                  spreadRadius: 2,
                                  offset: Offset(20, 0)),
                                   BoxShadow(
                                  color: Colors.white12,
                                  blurRadius: 0,
                                  spreadRadius: -2,
                                  offset: Offset(0, 0)),
                            ], shape: BoxShape.circle, color: Colors.white30),
                          ),
                        ),
                        const CardDetails(),
                ],
              ),
            );
          }),
        ),

      ],
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 20),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                alignment: Alignment.topLeft,
                width: width / 1.8,
                child: Image.asset(
                  "assets/mastercardlogo.png",
                  fit: BoxFit.fill,
                )),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: height / 10,
                width: width / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "**** **** **** ",
                          style: TextStyle(
                              fontSize: fontSize(20),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1930",
                          style: TextStyle(
                              fontSize: fontSize(30),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      "Platinum Card".toUpperCase(),
                      style: TextStyle(
                          fontSize: fontSize(15), fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              alignment: Alignment.bottomRight,
              width: width / 6,
              height: height / 16,
              decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: customShadow,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseSection extends StatelessWidget {
  const ExpenseSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Monthly Expenses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: expenses.map((value) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: pieColors[expenses.indexOf(value)],
                        ),
                        SizedBox(width: 5,),
                        Text(value['name'],
                        style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  )).toList(),
                ),
              ),
              ),
              Expanded(
                flex: 6,
                child: PieChart(),
              ),
          ],
        ),
      ],
    );
  }
}

class PieChart extends StatelessWidget {
  const PieChart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:5),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: customShadow,color: primaryColor),
        child: Stack(
          children: [
            // ignore: prefer_const_constructors
            CustomPaint(
              foregroundPainter: PieChartPainter(),
            ),
            Center(
              child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: customShadow,color: primaryColor),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width/2,size.height/2);
    double radius = min(size.width/2,size.height/2);
    var paint = new Paint()..style=PaintingStyle.stroke..strokeWidth=100;
    double total=0;
    for (var element in expenses) {total+=element['amount'];}
    var startRadian = -pi/2;
    for(int i=0;i<expenses.length;i++){
      var currentExpense = expenses[i];
      var sweepRadian = (currentExpense['amount']/total)*2*pi;
      paint.color=pieColors[i];
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}