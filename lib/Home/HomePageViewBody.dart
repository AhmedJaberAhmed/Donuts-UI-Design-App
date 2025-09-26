import 'package:donuts_app_ui_design/tabs/burger_tab.dart';
import 'package:donuts_app_ui_design/tabs/donut_tab.dart';
import 'package:donuts_app_ui_design/utils/my_tab.dart';
import 'package:flutter/material.dart';

import '../tabs/drink.dart';
import '../tabs/piza_tab.dart';
import '../tabs/smoothie_tab.dart';

class HomePageViewBody extends StatelessWidget {
  HomePageViewBody({super.key});

  List<Widget> myTabs = [
    MyTab(iconPath: "images/donuts/drink.png"),
    MyTab(iconPath: "images/donuts/pizza.png"),
    MyTab(iconPath: "images/donuts/burger.png"),
    MyTab(iconPath: "images/donuts/donut_.png"),
    MyTab(iconPath: "images/donuts/spaghetti.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: 36,
                    color: Colors.grey[800],
                  )),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 36,
                      color: Colors.grey[800],
                    )),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
                child: Row(
                  children: [
                    Text(
                      "I want to eat ",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "EAT",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TabBar(
                tabs: myTabs,
              ),
              Expanded(
                  child: TabBarView(children: [
                SmoothieTab(),
                PizzaTab(),
                BurgerTab(),
                DonutTab(),
                SpagettiTab()
              ]))
            ],
          ),
        ));
  }
}
