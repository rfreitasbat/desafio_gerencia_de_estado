abstract class GerenciaDeEstado<T> {
  final _state = <T>[];
  final _listens = <Function(T state)>[];

  List<T> get state => _state;

  void setState(T state) {
    _state.add(state);
    _update(state);
  }

  void removeState(T state) {
    _state.remove(state);
    _update(state);
  }

  void _update(T state) {
    _listens.forEach((element) {
      element(state);
    });
  }

  void listen(void Function(T state) x) {
    _listens.add(x);
  }
}
