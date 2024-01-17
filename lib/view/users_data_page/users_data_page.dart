import 'package:flutter/material.dart';
import 'package:konquer_test/repository/domain/api_client/api_services/user_data_services.dart';
import 'package:konquer_test/view/users_data_page/components/user_data_view.dart';

class UsersDataPage extends StatefulWidget {
  const UsersDataPage({super.key});

  @override
  State<UsersDataPage> createState() => _UsersDataPageState();
}

class _UsersDataPageState extends State<UsersDataPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List ageLimits = [
    AgeLimit(ageGTE: 0, ageLTE: 35),
    AgeLimit(ageGTE: 35, ageLTE: 99),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orange,
          ),
          tabs: [
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: const Align(
                    alignment: Alignment.center, child: Text('0-35')),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: const Align(
                    alignment: Alignment.center, child: Text('35-99')),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: ageLimits
              .map((e) => UserDataView(
                    ageLimit: e,
                  ))
              .toList()),
    );
  }
}
