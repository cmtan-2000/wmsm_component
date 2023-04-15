import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';
import 'package:wmsm_component/view/shared/header_widget.dart';

class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.lightBlue[100],
          elevation: 0,
          title: const Text("Wellness"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(physics: const ClampingScrollPhysics(), children: [
          <Widget>[
            const header_widget(),
            Divider(
              color: Colors.grey[300],
              thickness: 10,
            ).paddingDirectional(vertical: 20),
            <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[600],
                  tabs: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Tab(
                        text: "Steps",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Tab(
                        text: "Sleep",
                      ),
                    ),
                  ],
                ),
              ).height(40).padding(bottom: 30),
              SizedBox(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(
                      child: Text("Steps"),
                    ),
                    Placeholder(),
                  ],
                ),
              ),
            ]
                .toColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                )
                .paddingDirectional(vertical: 10, horizontal: 20)
          ].toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          ),
        ]),
      ),
    );
  }
}
