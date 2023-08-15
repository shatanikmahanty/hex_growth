import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hex_list/constants.dart';
import 'package:hexagon/hexagon.dart';

import 'hexagonal_grid.dart' as app_hexagonal_grid;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );

    return MaterialApp(
      title: 'HEX Growth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffd3f26a),
        ),
        scaffoldBackgroundColor: const Color(0xffd3f26a),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final widgetGap = SizedBox(
      height: size.height * 0.05,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Offstage(),
        centerTitle: true,
        leadingWidth: kPadding * 9.5,
        surfaceTintColor: Colors.transparent,
        leading: _AppBarButtons(
          icon: Icons.grid_view_rounded,
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(kPadding * 2),
            child: Icon(
              Icons.graphic_eq,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            widgetGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _HeadingText(
                  textHeight: 0.8,
                  text: "Market",
                ),
                const SizedBox(
                  width: kPadding * 1.5,
                ),
                HexagonWidget.pointy(
                  width: kPadding * 7.5,
                  cornerRadius: kPadding * 2.5,
                  color: Colors.black,
                  padding: 4.0,
                  child: const ImageIcon(
                    AssetImage('assets/vital_signs.png'),
                    color: Colors.white,
                    size: kPadding * 4,
                  ),
                ),
              ],
            ),
            const _HeadingText(
              text: "your growth",
              textHeight: 1.2,
            ),
            const _HeadingText(
              text: "strategy",
              textHeight: 1,
            ),
            widgetGap,
            const app_hexagonal_grid.HexagonalGrid(),
            widgetGap,
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: kPadding * 2.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              label: const Icon(
                Icons.arrow_circle_right,
                color: Colors.white,
                size: kPadding * 7.5,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kPadding * 5),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: kPadding * 4,
                ).copyWith(
                  right: 0,
                ),
              ),
            ),
            widgetGap,
          ],
        ),
      ),
    );
  }
}

class _AppBarButtons extends StatelessWidget {
  const _AppBarButtons({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding * 2,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: kPadding * 2.5,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _HeadingText extends StatelessWidget {
  const _HeadingText({required this.textHeight, required this.text});

  final double textHeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: kPadding * 5.5,
        fontWeight: FontWeight.bold,
        height: textHeight,
      ),
    );
  }
}
