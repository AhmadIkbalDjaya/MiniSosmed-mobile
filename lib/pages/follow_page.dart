import 'package:flutter/material.dart';
import 'package:mini_sosmed/components/minsos_bottom_app_bar.dart';
import 'package:mini_sosmed/components/person_box.dart';
import 'package:mini_sosmed/components/profile_widget.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';
import 'package:mini_sosmed/pages/profile_page.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  bool showBottomAppBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        title: Text(
          "Minsos",
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showBottomAppBar = !showBottomAppBar;
                setState(() {});
              },
              icon: Icon(
                Icons.menu,
              ),
            ),
          ),
        ],
        bottom: showBottomAppBar
            ? PreferredSize(
                child: MinsosBottomAppBar(),
                preferredSize: Size.fromHeight(175),
              )
            : null,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          // ProfileWidget(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mengikuti 65",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                // PersonBox(),
                // PersonBox(),
                // PersonBox(),
                // PersonBox(),
                // PersonBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
