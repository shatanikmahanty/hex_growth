import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class HexagonalGrid extends StatelessWidget {
  const HexagonalGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HexagonCard(
                  backgroundColor: const Color(0xffe8a4b1),
                  child: Image.asset(
                    'assets/girl_1.png',
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                const _HexagonCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50 ↗",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last Week",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _HexagonCard(),
                SizedBox(width: size.width * 0.02),
                _HexagonCard(
                  backgroundColor: const Color(0xff98bae2),
                  child: Image.asset(
                    'assets/girl_2.png',
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                const _HexagonCard(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width * 0.02),
                _HexagonCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/chart.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                _HexagonCard(
                  backgroundColor: const Color(
                    0xffb2a4c2,
                  ),
                  child: Image.asset(
                    'assets/man.png',
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 142,
          left: 80,
          child: Transform.rotate(
            angle: -0.555398,
            child: Container(
              color: Colors.white,
              height: 16,
              width: 185,
            ),
          ),
        ),
        Positioned(
          top: 272,
          left: 180,
          child: Transform.rotate(
            angle: -0.555398,
            child: Container(
              color: Colors.white,
              height: 16,
              width: 175,
            ),
          ),
        )
      ],
    );
  }
}

class _HexagonCard extends StatelessWidget {
  const _HexagonCard({
    this.backgroundColor = Colors.white,
    this.child,
  });

  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return HexagonWidget.pointy(
      width: size.width * 0.3,
      cornerRadius: 48,
      color: backgroundColor,
      padding: 4.0,
      child: child ?? const Offstage(),
    );
  }
}
