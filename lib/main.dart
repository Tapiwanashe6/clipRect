import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipRectDemoPage(),
    );
  }
}

class ClipRectDemoPage extends StatelessWidget {
  const ClipRectDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClipRRect vs ClipRect Demo"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ==============================
            /// SECTION 1 – SHAPE COMPARISON
            /// ==============================

            const Text(
              "Section 1: Shape Comparison",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                /// ClipRect (Sharp)
                Column(
                  children: [
                    const Text(
                      "ClipRect\n(Sharp Corners)",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ClipRect(
                      child: Container(
                        width: 120,
                        height: 120,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text(
                          "Content",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

                /// ClipRRect (Rounded)
                Column(
                  children: [
                    const Text(
                      "ClipRRect\n(Rounded Corners)",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 120,
                        height: 120,
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text(
                          "Content",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// ==============================
            /// SECTION 2 – OVERFLOW DEMO
            /// ==============================

            const Text(
              "Section 2: Overflow Comparison",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// WITHOUT ClipRect
                Column(
                  children: [
                    const Text(
                      "Without ClipRect\n(Overflow Visible)",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 120,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        color: Colors.grey.shade300,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none, // IMPORTANT
                        children: [
                          Positioned(
                            top: -50, // Force overflow
                            left: 10,
                            child: Image.network(
                              "https://picsum.photos/150",
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// WITH ClipRect
                Column(
                  children: [
                    const Text(
                      "With ClipRect\n(Overflow Clipped)",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ClipRect(
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2),
                          color: Colors.grey.shade300,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none, // Allow overflow
                          children: [
                            Positioned(
                              top: -50,
                              left: 10,
                              child: Image.network(
                                "https://picsum.photos/150",
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
