import 'package:flutter/material.dart';
import 'package:news_app/ui/tabs_items/tab_bar_item.dart';
import 'package:news_app/ui/news_items/news_tab.dart';

import '../../core/model/Sources.dart';

class TabListBar extends StatefulWidget {
List<MyTab> tabs;

TabListBar(this.tabs);

  @override
  State<TabListBar> createState() => _TabListBarState();
}

class _TabListBarState extends State<TabListBar> {
int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabs.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              onTap: (index){
                currentIndex = index;
                setState(() {});
              },
              isScrollable: true,
                tabs: widget.tabs.map((tab) {
                  return TabBarItem(
                    tab.name?? " " , currentIndex == widget.tabs.indexOf(tab)
                  );
                }).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: widget.tabs.map((tab) {
                  return  NewsTab(tab);
                }).toList(),
              ),
            )
          ],
        )

    );
  }
}
