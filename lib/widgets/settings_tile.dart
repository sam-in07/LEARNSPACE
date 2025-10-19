import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.isSignOut = false,
  });

  final int icon;
  final String title;
  final String subTitle;
  final bool isSignOut;

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  IconData getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.code;
      case 1:
        return Icons.support_agent_rounded;
      case 2:
        return Icons.contact_support_outlined;
      case 3:
        return Icons.star_border_outlined;
      case 4:
        return Icons.share_outlined;
      case 5:
        return Icons.logout;
      default:
        return Icons.rocket_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      children: [
        ListTile(
          leading: Icon(getIcon(widget.icon)),
          title: Text(widget.title),
          subtitle: Text(
            widget.subTitle,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        if (widget.isSignOut == false)
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(height: 2, color: Colors.grey[400]),
          ),
      ],
    );
  }
}
