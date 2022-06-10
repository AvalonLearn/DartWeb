// 删除元素 https://dart.cn/tutorials/web/low-level-html/remove-elements
import 'dart:html';

final InputElement toDoInput = querySelector('#to-do-input') as InputElement;
final UListElement toDoList = querySelector('#to-do-list') as UListElement;
final ButtonElement deleteAll = querySelector('#delete-all') as ButtonElement;
final ButtonElement addItem = querySelector('#add-button') as ButtonElement;

void main() {
  toDoInput.onChange.listen(addToDoItem);
  deleteAll.onClick.listen((_) => toDoList.children.clear());
  addItem.onClick.listen(addANum);
}

void addToDoItem(Event e) {
  final newToDo = LIElement()
    ..text = toDoInput.value == '' ? 'Empty' : toDoInput.value;
  newToDo.onClick.listen((_) => newToDo.remove());
  toDoInput.value = '';
  toDoList.children.add(newToDo);
}

void addANum(Event e) {
  final newNum = LIElement()..text = '${toDoList.children.length}';
  newNum.onClick.listen((_) => newNum.remove());
  toDoInput.value = '';
  toDoList.children.add(newNum);
}
