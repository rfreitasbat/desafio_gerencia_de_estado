import 'package:flutter/material.dart';

import 'package:ignite_flutter_todo_list/gerencia_de_estado.dart';

class BuilderWidget<T> extends StatefulWidget {
  final GerenciaDeEstado<T> controller;

  final Widget Function(BuildContext context, List<T> state) builder;

  BuilderWidget({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  _BuilderWidgetState createState() => _BuilderWidgetState<T>();
}

class _BuilderWidgetState<T> extends State<BuilderWidget<T>> {
  @override
  void initState() {
    widget.controller.listen(
      (state) {
        if (mounted) {
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.state);
  }
}
