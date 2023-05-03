import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wmsm_component/dashboard/widget/sleep_tab.dart';
import 'package:wmsm_component/dashboard/widget/steps_tab.dart';
import 'package:wmsm_component/shared/card_percent_indicator.dart';
import 'package:wmsm_component/shared/header_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => dashboard_state();
}

class dashboard_state extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
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
          backgroundColor: Colors.lightBlue[50],
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
              tab_bar(tabController: _tabController)
                  .height(40)
                  .padding(bottom: 30),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const StepsTab().padding(bottom: 20),
                    const SleepTab().padding(bottom: 20),
                  ],
                ),
              ),
            ]
                .toColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                )
                .paddingDirectional(vertical: 10, horizontal: 20)
          ].toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
          ),
        ]),
      ),
    );
  }
}

class tab_bar extends StatelessWidget {
  const tab_bar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
