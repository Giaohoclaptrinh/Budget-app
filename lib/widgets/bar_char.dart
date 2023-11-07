import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {

  final List<double> expenses;
  BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
      double mostExpensive = 0;
      expenses.forEach((double price) {
        if (price > mostExpensive) {
          mostExpensive  =price;
        }
      }); 


    return Padding(
      padding: EdgeInsets.all(12.0),  
    
    child:Column(
      children: <Widget>[
        Text('Weekly Spending', 
        style: TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWieght.bold, 
          letterSpacing: 1.2,
          ),//TextStyle
        ),//Text
        SizedBox(height: 5.0),
        Row(children: <Widget>[
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          IconButton(
            icon: Icon(
              Icons.arrow_back),
            iconSize: 30.0,
            onPressed: () {},
          ),//iconbutton
          Text('Nov 10, 2019 - Nov 16, 2019', 
          style: TextStyle(
            fontSize: 18.0, 
            fontWeight: FontWieght.w600,
            letterSpacing: 1.2,
            ),//TextStyle
          ),//Text
          IconButton(
            icon: Icon(
              Icons.arrow_foward),
            iconSize: 30.0,
            onPressed: () {},
          ),//iconbutton
        ],//Widget
        ),//Row
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisALignment: CrossAxisALignment.end,
          children: <Widget>[
            Bar(
              label: 'Su', 
              amountSpent: expenses[0], 
              mostExpensive: mostExpensive,
            ),//Bar
            Bar(
              label: 'Mo', 
              amountSpent: expenses[1], 
              mostExpensive: mostExpensive,
            ),//Bar
            Bar(
              label: 'Tu', 
              amountSpent: expenses[2], 
              mostExpensive: mostExpensive,
            ),//Bar
            Bar(
              label: 'We', 
              amountSpent: expenses[3], 
              mostExpensive: mostExpensive,
            ),//Bar
            Bar(
              label: 'Th', 
              amountSpent: expenses[4], 
              mostExpensive: mostExpensive,
            ),//Bar
            Bar(
              label: 'Fr', 
              amountSpent: expenses[5], 
              mostExpensive: mostExpensive,
            ),//Bar
            Bar(
              label: 'Sa', 
              amountSpent: expenses[6], 
              mostExpensive: mostExpensive,
            ),//Bar
          ],//Wiiget
        ),//Row
      ]//Widget
    ), //Column
    );//Padding
  }
}

class Bar extends StatelessWidget {

  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxBarHeight = 150.0;

  Bar({this.label, this.amountSpent, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(children: <Widget>[
      Text('\$${amountSpent.toStringAsFixed(2)}', 
      style: TextStyle(
        fontWeight: FontWieght.w600,
      ),//TextStyle
      ),//Text
      SizedBox(height: 6.0),
      Container(
        height: barHeight,
        width: 10.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
          borderRadius: BorderRadius.circular(6.0),
          ),//BorderDecoration    
        ),//Container
        SizedBox(height: 6.0),
        Text(label, style: 
        TextStyle(
          fontSize: 16.0,
          fontWeight: fontWeight.w600,
        ),//Textstyle
        ),//Text
      ],//Widget
    );//Column
  }
}