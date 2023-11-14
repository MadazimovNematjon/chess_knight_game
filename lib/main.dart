import 'package:chess_knight_game/pages/game_page.dart';
import 'package:chess_knight_game/service/di_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: GamePage(),
    );
  }
}

