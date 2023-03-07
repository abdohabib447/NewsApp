import 'package:flutter/material.dart';

import '../../mu_theme_data.dart';

class TabBarItem extends StatelessWidget{
String tabBarName;
bool isSelected ;
  TabBarItem(this.tabBarName , this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(25),
       border: Border.all(color: MyThemeData.primaryColor ),
       color: isSelected ? MyThemeData.primaryColor : Colors.transparent,

     ),
      child: Text(tabBarName , style: Theme.of(context).textTheme.displayMedium!.copyWith(
        color: isSelected ? Colors.white : MyThemeData.primaryColor
      ),),
    );
  }
}
