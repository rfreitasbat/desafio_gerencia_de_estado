import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ignite_flutter_todo_list/gerencia_de_estado.dart';
import 'package:ignite_flutter_todo_list/home_controller.dart';

void main() {
  var texto = "texto inicial";

  late HomeController controller;

  setUp(() {
    controller = HomeController();
  });

  test("Testando a Gerencia de Estado da HomeController", () {
    controller.listen(() {
      expect(controller.toDoItemList.length, 1);
    });
    // controller.listen((state) {
    //   expect(controller.state, texto);
    // });

    controller.onAddItem("teste");

    // texto = "teste";
    // controller.setState(texto);
  });
}
