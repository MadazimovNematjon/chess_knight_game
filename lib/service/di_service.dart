import 'package:chess_knight_game/controller/moves_controller.dart';
import 'package:get/get.dart';

class DIService {

  static Future<void> init() async {
    Get.lazyPut<MovesController>(() => MovesController(), fenix: true);

  }
}