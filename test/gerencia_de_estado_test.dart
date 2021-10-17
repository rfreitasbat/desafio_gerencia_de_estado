import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ignite_flutter_todo_list/gerencia_de_estado.dart';
import 'package:ignite_flutter_todo_list/home_controller.dart';

void main() {
  var texto = "texto inicial";

  late GerenciaDeEstado controller;

  setUp(() {
    controller = HomeController();
  });

  // test("Testando A Gerencia de Estado", () {
  //   controller.listen((state) {
  //     expect(controller.state, texto);
  //   });
  //   controller.listen((state) {
  //     expect(controller.state, texto);
  //   });

  //   controller.setState(texto);

  //   texto = "teste";
  //   controller.setState(texto);
  // });
}
