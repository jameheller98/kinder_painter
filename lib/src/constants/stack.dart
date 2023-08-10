class Stack<E> {
  List<E> _list = <E>[];

  Stack(List<E> listCopy) {
    _list = [...listCopy];
  }

  void forEach(void Function(E e) callback) {
    _list.forEach(callback);
  }

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;

  Stack<E> copyWith() {
    return Stack(_list);
  }

  @override
  String toString() => _list.toString();
}
