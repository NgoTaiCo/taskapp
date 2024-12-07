import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [Icon(Icons.notifications)],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hi, Zohaib Hassan',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/icons/verified.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 5),
              const Text(
                "Verified",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      leading: const Icon(Icons.menu),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
