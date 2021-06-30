import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/theme/change_theme_mode.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Light/Dark Mode:'),
                ChangeThemeButtonWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
