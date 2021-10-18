import 'package:flutter/material.dart';

import '/gerencia_de_estado.dart';

class BuilderWidget<T> extends StatefulWidget {
  final GerenciaDeEstado controller;

  final Widget Function(BuildContext context) builder;

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
      () {
        if (mounted) {
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
