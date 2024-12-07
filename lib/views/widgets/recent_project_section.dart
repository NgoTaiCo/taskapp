import 'package:flutter/material.dart';

class RecentProjectsSection extends StatefulWidget {
  const RecentProjectsSection({super.key});

  @override
  State<RecentProjectsSection> createState() => _RecentProjectsSectionState();
}

class _RecentProjectsSectionState extends State<RecentProjectsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _imagePaths = [
    'assets/icons/background_dashboard.png',
    'assets/icons/background_dashboard.png',
    'assets/icons/background_dashboard.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 28),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _imagePaths.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    _imagePaths[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
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
              color: Color(0xFF2E7758),
            ),
            child: Row(
              children: [
                const Text(
                  "Recent Green Projects",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 5),
                Image.asset('assets/icons/arrow_right.png', fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _imagePaths.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index ? 16 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? const Color(0xFF2E7758) : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
