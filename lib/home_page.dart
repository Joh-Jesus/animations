import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> squadSize;
  late final Animation<Color?> squadColor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    squadSize = Tween<double>(begin: 100, end: 375).animate(controller);
    squadColor =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (controller.value > 0) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: AnimatedBuilder(
            animation: squadSize,
            builder: (context, widget) {
              return Container(
                height: squadSize.value,
                width: squadSize.value,
                color: squadColor.value,
              );
            },
          ),
        ),
      ),
    );
  }
}
