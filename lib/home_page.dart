import 'package:flutter/material.dart';
import 'package:ignite_flutter_todo_list/builder_widget.dart';
import 'package:ignite_flutter_todo_list/home_controller.dart';

import 'screens/done_screen.dart';
import 'screens/task_screen.dart';
import 'shared/models/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toDoItemListController = HomeController();
  final _doneItemListController = HomeController();

  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  var _selectedIndex = 0;

  void onAddItem(String itemTitle) {
    _toDoItemListController.onAddItem(
      ToDoItem(title: itemTitle),
    );
  }

  void onResetItem(ToDoItem item) {
    _doneItemListController.onRemoveItem(item);

    _toDoItemListController.onAddItem(
      ToDoItem(title: item.title),
    );
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemListController.onRemoveItem(item);
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemListController.onRemoveItem(item);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemListController.onRemoveItem(item);

    _doneItemListController.onAddItem(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          BuilderWidget<ToDoItem>(
            controller: _toDoItemListController,
            builder: (context, state) {
              return TaskScreen(
                itemList: state,
                onAddItem: onAddItem,
                onCompleteItem: onCompleteItem,
                onRemoveItem: onRemoveToDoItem,
              );
            },
          ),
          BuilderWidget<ToDoItem>(
            controller: _doneItemListController,
            builder: (context, state) {
              return DoneScreen(
                itemList: state,
                onRemoveItem: onRemoveDoneItem,
                onResetItem: onResetItem,
              );
            },
          ),
        ],
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          _pageViewController.animateToPage(
            _selectedIndex,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Concluídas',
          ),
        ],
      ),
    );
  }
}
