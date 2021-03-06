import 'package:flutter/material.dart';
import 'package:tabbar/tabbar.dart';
import 'dart:ui';
import 'package:useful_useless_app/ui/shared_preference.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:useful_useless_app/ui/global/google_maps_widget.dart';

class CustomeTabBar extends StatefulWidget {
  @override
  _CustomeTabBarState createState() => _CustomeTabBarState();
}

class _CustomeTabBarState extends State<CustomeTabBar> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SharedPref()),
                );
              }
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabbarHeader(
            controller: controller,
            tabs: [
              Tab(icon: Icon(Icons.map, size: 40), text: 'map'.tr()),
              Tab(icon: Icon(Icons.list, size: 40), text: 'list'.tr()),
              Tab(
                icon: Icon(Icons.person, size: 40),
                text: 'profile'.tr(),
              ),
            ],
          ),
        ),
      ),
      body: TabbarContent(
        controller: controller,
        children: <Widget>[
          GoogleMapsWidget(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
