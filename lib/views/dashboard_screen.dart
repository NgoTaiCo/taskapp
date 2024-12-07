import 'package:flutter/material.dart';
import 'package:taskapp/views/widgets/account_summary_card.dart';
import 'package:taskapp/views/widgets/dashboard_appbar.dart';
import 'package:taskapp/views/widgets/recent_project_section.dart';
import 'package:taskapp/views/widgets/tree_pool_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DashboardAppBar(),
      body: Center(
        child: Column(
          children: [
            AccountSummaryCard(),
            TreePoolSection(),
            RecentProjectsSection(),
          ],
        ),
      ),
    );
  }
}
