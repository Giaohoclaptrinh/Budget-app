import 'package:flutter/material.dart';
class CategoryScreen extends StatefulWidget {

  final Category category;

  CategoryScreen({this.category});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expenses) {
      expenseList.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(10.0),
          boxShadow : [BoxShadow(color: Colors.black12, offset: Offset(0, 2),
          blurRadius: 6.0,
          ),//boxshadow
          ],
        ),//Box decoration
      Padding(
        padding: EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text(
          expenses.name, 
          style: TextStyle(
            fontSize: 20.0, 
            fontWeight: FontWeight.bold
        ),//TextStyle
        ),//Text
        Text('-\$${expense.cost.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0, 
            fontWeight: FontWeight.w600,
          ),//TextStyle
        ),//text
      ],//Widget
      ),//Row
      ),//Padding
      ));//Container
    });
    return Column(children: expenseList,
    ); 
  }
 
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expenses) {
      totalAmountSpent += expenses.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        action: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},
            ),//IconButton
          ],//Widget
      ),//Appbar
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0.2),  blurRadius: 6.0,),
                ],//Boxshadow
              ),//Boxdecoration
              child: CustomPaint(
                foregroundPainter: RadialPainter(bgColor: Colors.grey[200],
                lineColor: getColor(context, percent), 
                percent: percent,
                width: 15.0,
                ),//RadialPainter
              child: Center(
                child: Text('\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount}',
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w600,
                ),//Textstyle
              ),//Text
              ),//Center
              ),//CustomPaint
            ),//Container
            _buildExpenses(),
          ], //Widget
        ),//Column
      ),//SingleChildScrollView
    );//ScaffFold
  }
}