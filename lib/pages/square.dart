
import 'package:flutter/material.dart';

import '../controller/chess_piece.dart';



class Square extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isWhite;
  final bool isSelected;
  final bool isValidMove;
  final ChessPiece? piece;

  Square(
      {Key? key,
        required this.isWhite,
        required this.piece,
        required this.isSelected,
        required this.isValidMove,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    if (isSelected) {
      squareColor = Colors.green;
    }else if(isValidMove){
      squareColor = Colors.green.shade200;
    }
    else {
      squareColor = isWhite ? Color(0xFFDEE3C3) : Color(0xFF292B32);
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
          piece!.image!,
          color: Colors.black,
          fit: BoxFit.cover,
        )
            : null,
      ),
    );
  }
}