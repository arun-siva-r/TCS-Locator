import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget {
  const CommonAppBar({super.key, this.isLeadingIcon = false});

  final bool isLeadingIcon;

  @override
  State<StatefulWidget> createState() => CommonAppBarState();
}

class CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isLeadingIcon
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(left: 20, top: 10),
            )
          : Container(width: 0),
      leadingWidth: widget.isLeadingIcon ? 30 : 0.0,
      backgroundColor: Colors.black,
      title: const Padding(
        padding: EdgeInsets.only(top: 10, left: 0),
        child: Text(
          'TCS Locator',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      //centerTitle: widget.isLeadingIcon,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 30),
          child: Image.asset(
            "assets/images/tcs_logo.png",
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        )
      ],
    );
  }
}
