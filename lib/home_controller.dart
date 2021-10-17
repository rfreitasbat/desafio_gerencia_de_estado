import 'gerencia_de_estado.dart';
import 'shared/models/todo_item.dart';

class HomeController extends GerenciaDeEstado<ToDoItem> {
  // final _toDoItemList = <ToDoItem>[];
  // final _doneItemList = <ToDoItem>[];

  void onAddItem(ToDoItem state) {
    super.setState(state);
  }

  void onRemoveItem(ToDoItem state) {
    super.removeState(state);
  }
}
