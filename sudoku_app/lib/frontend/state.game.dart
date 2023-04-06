import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class gameState extends GetxController {
  late List<List<int>> game;
  late List<List<int>> gameCopy;
  late List<List<int>> gameSolved;
  late List<List<List<int>>> gameList;
  Rx<Point> selectedIndex = Rx(const Point(-1, -1));
  bool gameOver = true;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    newGame();
  }

  static List<List<int>> copyGrid(List<List<int>> grid) {
    return grid.map((row) => [...row]).toList();
  }

  Row oneRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // children: createButtons(),
    );
  }

  List<Row> createRows() {
    List<Row> rowList = List<Row>.generate(9, (i) => oneRow());
    return rowList;
  }

  void newGame([String difficulty = 'easy']) {
    Future.delayed(const Duration(milliseconds: 200), () {
      setGame(2, difficulty);

      gameOver = false;
      refresh();
      // isFABDisabled = !isFABDisabled;
    });
  }

  void setGame(int mode, [String difficulty = 'easy']) async {
    if (mode == 1) {
      game = List.filled(9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
      gameCopy = List.filled(9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
      gameSolved = List.filled(9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
    } else {
      gameList = await getNewGame(difficulty);
      game = gameList[0];
      gameCopy = copyGrid(game);
      gameSolved = gameList[1];
    }
  }

  static Future<List<List<List<int>>>> getNewGame(
      [String difficulty = 'easy']) async {
    int emptySquares;
    switch (difficulty) {
      case 'test':
        {
          emptySquares = 2;
        }
        break;
      case 'beginner':
        {
          emptySquares = 18;
        }
        break;
      case 'easy':
        {
          emptySquares = 27;
        }
        break;
      case 'medium':
        {
          emptySquares = 36;
        }
        break;
      case 'hard':
        {
          emptySquares = 54;
        }
        break;
      default:
        {
          emptySquares = 2;
        }
        break;
    }
    SudokuGenerator generator = SudokuGenerator(emptySquares: emptySquares);
    return [generator.newSudoku, generator.newSudokuSolved];
  }
}
