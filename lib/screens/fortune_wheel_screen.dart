import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_wheel_app/widgets/colors.dart';
import 'package:fortune_wheel_app/widgets/icon_button_widget.dart';
import 'package:fortune_wheel_app/widgets/spin_button.dart';
import 'package:fortune_wheel_app/widgets/star_widget.dart';
import 'package:fortune_wheel_app/widgets/triangle_widget.dart';

class FortuneWheelScreen extends StatefulWidget {
  const FortuneWheelScreen({super.key});

  @override
  State<FortuneWheelScreen> createState() => _FortuneWheelScreenState();
}

class _FortuneWheelScreenState extends State<FortuneWheelScreen> {
  final StreamController<int> controller = StreamController<int>();
  final List<String> items = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortune wheel'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 32.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const TriangleWidget(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: screenWidth,
                  child: Center(
                    child: SizedBox(
                      width: screenWidth > 500.0 ? 500.0 : screenWidth,
                      height: screenWidth > 500.0 ? 500.0 : screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 48.0,
                        ),
                        child: FortuneWheel(
                          animateFirst: false,
                          selected: controller.stream,
                          items: [
                            for (final String item in items)
                              FortuneItem(
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 64.0),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: items.length < 15
                                            ? 40
                                            : items.length < 20
                                                ? 30
                                                : 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                style: FortuneItemStyle(
                                  color: hexToColor(
                                    colors[items.indexOf(item)],
                                  ),
                                  borderWidth: 0,
                                ),
                              )
                          ],
                          indicators: const [
                            FortuneIndicator(
                              alignment: Alignment.topCenter,
                              child: TriangleIndicator(
                                color: Colors.purple,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const StarWidget(),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpinButton(onPressed: () {
              controller.add(
                Fortune.randomInt(0, items.length),
              );
            }),
            Row(
              children: [
                IconButtonWidget(
                  icon: Icons.add,
                  onPressed: () {
                    addItem();
                  },
                ),
                const SizedBox(
                  width: 16.0,
                ),
                IconButtonWidget(
                  icon: Icons.remove,
                  onPressed: () {
                    removeItem();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void addItem() {
    if (items.length < 30) {
      final String newItem = (int.parse(items.last) + 1).toString();
      setState(() {
        items.add(newItem);
      });
    }
  }

  void removeItem() {
    if (items.length > 2) {
      setState(() {
        items.removeLast();
      });
    }
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
