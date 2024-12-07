import 'package:flutter/material.dart';

class TreePoolSection extends StatelessWidget {
  const TreePoolSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color(0xFFEDF5F6),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/icons/pana.png', fit: BoxFit.cover),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11).copyWith(bottom: 31),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Text(
                        "My Tree Pool",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2E7758),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        Image.asset('assets/icons/add_project.png', fit: BoxFit.cover),
                        const Positioned(
                          top: 32,
                          right: 12,
                          child: Text(
                            "Add\nGreen Project",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/icons/progress_bar.png', fit: BoxFit.cover),
                    const Text("Projects Completion"),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 26,
            left: 20,
            child: OvalButton(text: "10,000 Trees"),
          ),
        ],
      ),
    );
  }
}

class OvalButton extends StatelessWidget {
  final String text;

  const OvalButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 37),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.elliptical(100, 50)),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
