import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [const Icon(Icons.notifications)],
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
                const SizedBox(
                  width: 5,
                ),
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
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: const Color(0xFFEDF5F6),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 26,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  "Carbon Credits Available",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF2E7758),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  color: const Color(0xFF2E7758),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: const Center(
                                    child: Text(
                                      "20,000(tons of co2)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                const SizedBox(
                                  width: 140,
                                  child: Text(
                                    "Carbon Credits Sold",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF2E7758),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF0E46A3),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: const Center(
                                      child: Text(
                                        "20,000(tons of co2)",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 46,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  "Carbon Credits Earned",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF52BF90),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  color: const Color(0xFF2E7758),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: const Center(
                                    child: Text(
                                      "20,000(tons of co2)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 27 / 2,
                  left: 28,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 9),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xFF071952),
                    ),
                    child: const Text(
                      "Account Summary",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
