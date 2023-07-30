import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/icon_button_custom.dart';

class GroupLeft extends StatelessWidget {
  final List<Widget> groupButton;
  const GroupLeft({super.key, required this.groupButton});

  @override
  Widget build(BuildContext context) {
    final List<Widget> newGroup = [
      if (Navigator.of(context).canPop())
        IconButtonCustom(
          onPress: () => Navigator.of(context).pop(),
          themeName: ThemeNameButtonIcon.green,
          svgPictureUrl: 'assets/svgs/arrow-left.svg',
        ),
    ];

    for (int i = 0; i < groupButton.length; i++) {
      if (i == 0 && newGroup.isEmpty) {
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
