import 'package:flutter/material.dart';
class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 20,
        onTap: onTap,
        dense: true,
        leading: Icon(
          iconData,
          size: MediaQuery.of(context).size.width<360?25:30,
          // color: Kolors.black,
        ),
        title: Text(
          title,
          style:  TextStyle(
            fontSize: MediaQuery.of(context).size.width<360?15:16,
            // color: Kolors.black,
          ),
        ),
      ),
    );
  }
}
