import 'gerencia_de_estado.dart';
import 'shared/models/todo_item.dart';

class HomeController extends GerenciaDeEstado {
  final _toDoItemList = <ToDoItem>[];
  final _doneItemList = <ToDoItem>[];

  List<ToDoItem> get toDoItemList => _toDoItemList;
  List<ToDoItem> get doneItemList => _doneItemList;

  void onAddItem(String itemTitle) {
    _toDoItemList.add(ToDoItem(title: itemTitle));
    super.setState();
  }

  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);
    _toDoItemList.add(ToDoItem(
      title: item.title,
      isDone: false,
    ));

    super.setState();
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);

    super.setState();
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);

    super.setState();
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);
    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );

    super.setState();
  }
}
