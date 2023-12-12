import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:testapp/api/api.dart';

class HomePage extends StatefulWidget {
  final String title = "动态";

  @override
  State<StatefulWidget> createState() => _HomePageStatus();
}

class _HomePageStatus extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

  final _api = API();

  @override
  void initState() {
    _api.getBookList({
      "advancedRetrievalParams": [],
      "order": "asc",
      "page": 1,
      "rows": 10,
      "sort": "sourceId"
    }, (map) {
      print(map.toString());
    });
  }

  final _tabs = ['动态', '推荐'];

  Widget getWidget() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("动态"),
        ),
        bottomNavigationBar: _BottomNavigationBarFull(),
        body: const BodyListClass());
  }
}

class _BottomNavigationBarFull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigation();
  final _tabs = ['动态', '推荐'];
}

class _BottomNavigation extends State<_BottomNavigationBarFull>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget._tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(controller: _tabController, tabs: [
      for (var i = 0; i < widget._tabs.length; i++) Tab(text: widget._tabs[i])
    ]);
  }
}

class BodyListClass extends StatefulWidget {
  const BodyListClass({super.key});

  @override
  State<StatefulWidget> createState() => _BodyListClass();
}

class _BodyListClass extends State<BodyListClass> {
  @override
  Widget build(BuildContext context) {
    return const Text("1231231");
  }
}
