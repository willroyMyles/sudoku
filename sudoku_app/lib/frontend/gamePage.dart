import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_app/frontend/grindPainter.dart';
import 'package:sudoku_app/frontend/state.game.dart';

class GameScreen extends StatelessWidget {
  GameScreen({super.key});
  final controller = Get.put(gameState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
        ),
        body: GetBuilder<gameState>(
            init: controller,
            builder: (_) {
              var cellSize = 65.0;
              return Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              width: cellSize * 9,
                              height: cellSize * 9,
                              child: CustomPaint(
                                size: Size(cellSize * 9, cellSize * 9),
                                painter: GridPainter(boxesToOutline: [
                                  const Point(0, 0),
                                  const Point(1, 0),
                                  const Point(2, 0),
                                  const Point(2, 1),
                                  // Point(x: 0, y: 0),
                                ]
                                    // const Offset(0.1, 0.2)
                                    ),
                                child: Column(
                                  children: [
                                    ...List.generate(
                                      3,
                                      (index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ...List.generate(
                                                3,
                                                (index) => Container(
                                                      width: cellSize * 3,
                                                      height: cellSize * 3,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.5,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .4)),
                                                        color: Colors.green
                                                            .withOpacity(.0),
                                                      ),
                                                    ))
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(
                              9,
                              (index) {
                                var row = controller.game[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...row.map(
                                      (e) {
                                        var idx = row.indexOf(e);
                                        var selectd = Point(index, idx) ==
                                            controller.selectedIndex.value;

                                        return Container(
                                          padding: const EdgeInsets.all(7),
                                          height: cellSize,
                                          width: cellSize,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(.2))),
                                          child: InkWell(
                                            onTap: () {
                                              controller.selectedIndex.value =
                                                  Point(index, idx);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: selectd
                                                      ? Colors.blue
                                                          .withOpacity(.4)
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        blurRadius: 6)
                                                  ]),
                                              child: Text(
                                                e == 0 ? "" : e.toString(),
                                                textScaleFactor: 1.4,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                );
                              },
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.newGame();
                                },
                                child: const Text("new game")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    9,
                                    (index) => Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.all(5),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(.2),
                                                    blurRadius: 6)
                                              ]),
                                          child: Text(
                                            index.toString(),
                                            textScaleFactor: 1.4,
                                          ),
                                        ))
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
