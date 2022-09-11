import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_template/presentation/core/layout_widget/log_out_dialog.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';
import 'package:flutter_template/presentation/drawer/widgets/drawer_tile.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,

                // physics: NeverScrollableScrollPhysics(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBoxH10(),
                  // MediaQuery.of(context).size.width < 360
                  //     ? const SizedBoxH10()
                  //     : const SizedBoxH30(),
                  DrawerTile(
                    iconData: Icons.person,
                    onTap: () async {
                      AutoRouter.of(context).push(const ProfileRoute());
                    },
                    title: "Profile",
                  ),
                  const SizedBoxH10(),
                  DrawerTile(
                    iconData: Icons.history,
                    onTap: () async {},
                    title: "Order History",
                  ),

                  const SizedBoxH10(),
                  DrawerTile(
                    iconData: Icons.logout,
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => const LogOutDialog(),
                      );
                    },
                    title: "Log out",
                  ),
                  const SizedBoxH10(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
