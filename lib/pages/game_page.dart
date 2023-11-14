import 'package:chess_knight_game/controller/moves_controller.dart';
import 'package:chess_knight_game/pages/square.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/help.dart';


class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<MovesController>().initializeBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF224242),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: GetBuilder<MovesController>(
            init: MovesController(),
            builder: (controller) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                ),
                itemCount: 8 * 8,
                itemBuilder: (context, index) {
                  int row = index ~/ 8;
                  int col = index % 8;
                  bool isSelected = controller.selectedRow == row && controller.selectedCol == col;
                  bool isValidMove = false;

                  for (var position in controller.validMoves) {
                    if (position[0] == row && position[1] == col) {
                      isValidMove = true;
                    }
                  }

                  return Square(
                    isWhite: isWhite(index),
                    isSelected: isSelected,
                    isValidMove: isValidMove,
                    onTap: () {
                      controller.pieceSelected(row, col);
                    },
                    piece: controller.board[row][col],
                  );
                },
              );
            },
          ),
        ),
      ),
    );

  }
}

