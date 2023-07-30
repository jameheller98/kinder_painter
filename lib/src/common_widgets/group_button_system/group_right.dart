import 'package:flutter/material.dart';

class GroupRight extends StatelessWidget {
  final List<Widget> groupButton;
  const GroupRight({super.key, required this.groupButton});

  @override
  Widget build(BuildContext context) {
    final List<Widget> newGroup = [];

    for (int i = 0; i < groupButton.length; i++) {
      if (i == 0) {
        newGroup.add(groupButton[i]);
      } else {
        newGroup.addAll([
          const SizedBox(width: 20),
          groupButton[i],
        ]);
      }
    }

    return Row(
      children: newGroup,
    );
  }
}
