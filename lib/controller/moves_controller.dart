import 'package:get/get.dart';

import 'chess_piece.dart';
import 'help.dart';

class MovesController extends GetxController{

  ChessPiece? selectedPiece;
  bool image = false;
  List<List<int>> validMoves = [];
  int selectedRow = -1;
  int r = -1;
  int c = -1;
  int selectedCol = -1;
  late List<List<ChessPiece?>> board;  // Updated the type

  initializeBoard() {
    List<List<ChessPiece?>> newBoard = List.generate(8, (index) => List.generate(8, (index) => null));

    // Initialize the specific square with a knight piece
    try {
      newBoard[0][0] = ChessPiece(
        image: "assets/images/horse.png",
        isWhite: true, // Set the color of the piece (true for white)
      );
    } catch (e) {
      print(e);
    }

    board = newBoard;
  }





  void movePiece(int newRow, int newCol) {
    // Check if the target square is empty or has an enemy piece before moving.

    if (board[newRow][newCol] == null ) {
      board[newRow][newCol] = ChessPiece(
        image: "assets/images/horse.png",
        isWhite: true, // Set the color of the knight (true for white).
      );
      // Clear the old position only if the move was successful.
      board[selectedRow][selectedCol] = null;
    }
    selectedPiece = null;
    selectedCol = -1;
    selectedRow = -1;
    validMoves = [];
    update();
  }

  void pieceSelected(int row, int col) {
    if (selectedPiece == null) {
      // No piece is currently selected, select the piece if one exists in the square.
      if (board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedCol = col;
        selectedRow = row;
        validMoves = calculateRawMovies(row: row, col:col,piece: selectedPiece);
      }
    } else {
      // A piece is already selected, attempt to move it to the tapped square.
      if (validMoves.any((element) => element[0] == row && element[1] == col)) {
        movePiece(row, col);
        // Now, after moving the piece, we can add a knight to the selected square.
        board[row][col] = ChessPiece(
          image: "assets/images/horse.png",
          isWhite: true, // Set the color of the knight (true for white).
        );
      }
    }
    update();
  }


  calculateRawMovies({int? row, int? col, ChessPiece? piece}) {
    List<List<int>> candidateMoves = [];

    var knightMovie = [
      [-2, -1], // up 2 left 1
      [-2, 1], // up 2 right 1
      [-1, -2], // up 1 left 2
      [-1, 2], // up 1 right 2
      [2, -1], // down 2 left -1
      [2, 1], // down 2 right 1
      [1,2] ,//down 1 right 2
      [1,-2] //down 1 left -2
    ];

    for(var move in knightMovie){
      var newRow = row! + move[0];
      var newCol = col! + move[1];

      if(!isInBoard(newRow, newCol)){
        continue;
      }

      if (board[newRow][newCol] != null) {
        if (board[newRow][newCol]!.isWhite != (piece?.isWhite ?? false)) {
          candidateMoves.add([newRow, newCol]);
        }
        continue;
      }

      candidateMoves.add([newRow,newCol]);

    }
    update();
    return candidateMoves;
  }




}