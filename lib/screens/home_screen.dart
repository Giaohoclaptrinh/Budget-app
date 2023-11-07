import 'package:flutter/material.dart';
import 'package:Project2/lib/data/data.dart';
import 'package:Project2/lib/widgets/bar_char.dart';
import 'package:Project2/lib/helpers/color_helper.dart';
import 'package:Project2/lib/models/category_model.dart';
import 'package:Project2/lib/models/expense_model.dart';
import 'package:Project2/lib/screens/category_screen.dart';
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _buildCategory(Category category, double totalAmountSpent) {
    return GestureDetector(
      ontap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(category: category),
      ),//MaterialPageRoute
      ),
    child: Container(margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    padding: EdgeInsets.all(20.0),
    height: 100.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 2),
        blurRadius: 6.0,
        ),//BoxShadow
      ],
    ),//Boxdecoration
    child: Column( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
          Text(
            category.name, 
            style: TextStyle(
              fontSize: 20.0, 
              fontWeight: FontWeight.w600,
          ),//TextStyle
          ),//Text
            Text(category.name),
            Text('\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)}/ \$${category.maxAmount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.w600, 
            ),//TextStyle
            ),//Text
      ],//Widget
      ),//Row
      SizedBox(height: 10.0),
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxBarWidth = constraints.maxWidth;
          final double percent = (category.maxAmount - totalAmountSpent) /category.maxAmount;
          double barWidth = percent * maxBarWidth;


          if (barWidth < 0) {
             barWidth =0;
          }
      return Stack(
        children: <Widget>[
          Container(
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0),
              ),//BorderDecoration
            ),//Container
            Container(
              height: 20.0,
              width: barWidth,
              decoration: BoxDecoration(
                color: getColor(context, percent),
                borderRadius: BorderRadius.circular(15.0),
              ),//Boxdecoration
            ),//container
      ],//Widget
      );//Stack
        },
      ),//layoutbuilder
    ],//Widget
    ),//Column
    ),//container
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[ 
          SliverAppBar(
            forceElevated: true,
            floating: true,
            //pinned: true,
            expandedHeight: 100.0,
            leading: IconButton(icon: Icon(Icons.settings),
            iconSize: 30.0,
            onPressed: () {},
            ),//IconButton
            flexibleSpace: FlexibleSpaceBar(title: Text('Simple Budget'),
           ),//FlexibleSpaceBar
           action: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              onPressed: () {},
            ),//IconButton
           ],//Widget
          ),//SilverAppBar
          SivlerList(
            delegate: SliverChildBuilderDelegate(
              [BuildContext context, int index] {
                if(index==0) {
                 return Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.black12, 
                      offset: Offset(0, 2), 
                      blurRadius: 6.0,
                        ),//BoxShadow
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),//Boxdecoration
                    child: BarChart(weeklySpending),
                 ); //Container
                } else{
                  final Category category = categories[index - 1];
                  double totalAmountSpent = 0;
                  category.expenses.forEach((Expense expenses) {
                    totalAmountSpent += expenses.cost;
                  });
                  return _buildCategory(category, totalAmountSpent);
                }
              },
              childCount: 1 + categories.length,
            ),//SliverChildBuilderDelegate
          ),//Silverlist
        ],//Widget
      ),//CustomScrollview
    );//Scaffold
  }
}