import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/icon_button_custom.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/text_button_custom/text_button_custom.dart';
import 'package:master_source_flutter/src/common_widgets/group_button_system/group_left.dart';
import 'package:master_source_flutter/src/common_widgets/group_button_system/group_right.dart';

enum ButtonGroup {
  upgrade,
  notification,
  setting,
}

enum ButtonPosition {
  left,
  right,
}

class GroupButtonSystem extends StatelessWidget {
  final Widget child;
  final Map<ButtonGroup, ButtonPosition>? buttonGroup;

  const GroupButtonSystem({super.key, required this.child, this.buttonGroup});

  @override
  Widget build(BuildContext context) {
    final Map<ButtonPosition, List<Widget>> group = {
      ButtonPosition.left: [],
      ButtonPosition.right: [],
    };

    if (buttonGroup != null) {
      for (var element in buttonGroup!.entries) {
        switch (element.key) {
          case ButtonGroup.upgrade:
            group[element.value]!.add(
              TextButtonCustom(
                onPress: () {},
                themeName: ThemeNameButtonText.emerald,
                title: 'Nâng cấp',
              ),
            );
            break;
          case ButtonGroup.notification:
            group[element.value]!.add(
              IconButtonCustom(
                onPress: () {},
                themeName: ThemeNameButtonIcon.yellow,
                svgPictureUrl: 'assets/svgs/bell-simple-ringing.svg',
                isNotification: true,
              ),
            );
            break;
          case ButtonGroup.setting:
            group[element.value]!.add(
              IconButtonCustom(
                onPress: () {},
                themeName: ThemeNameButtonIcon.purple,
                svgPictureUrl: 'assets/svgs/gear-six.svg',
              ),
            );
            break;
        }
      }
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Padding(
          padding: const EdgeInsets.only(top: 11, right: 18, left: 20),
          child: SizedBox(
            height: 39,
            child: Row(
              children: [
                GroupLeft(groupButton: group[ButtonPosition.left]!),
                const Spacer(),
                GroupRight(groupButton: group[ButtonPosition.right]!),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
