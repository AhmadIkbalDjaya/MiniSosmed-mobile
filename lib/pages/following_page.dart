import 'package:flutter/material.dart';
import 'package:mini_sosmed/components/minsos_bottom_app_bar.dart';
import 'package:mini_sosmed/components/person_box.dart';
import 'package:mini_sosmed/components/profile_widget.dart';
import 'package:mini_sosmed/controller/UserController.dart';
import 'package:mini_sosmed/model/profile.dart';
import 'package:mini_sosmed/model/users.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key, required this.username});
  final String username;

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  bool showBottomAppBar = false;
  final userContoller = UserContoller();
  List<Users> users = [];
  Profile? profile;

  Future<dynamic> fetchFollowing() async {
    try {
      List<Users> fetchUser =
          await userContoller.userFollowing(widget.username);
      setState(() {
        users = fetchUser;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> fetchProfile([String? username]) async {
    try {
      Profile fetchProfileData =
          await userContoller.profileUser(username ?? widget.username);
      setState(() {
        profile = fetchProfileData;
        // print(profile);
      });
    } catch (e) {
      // print("Error fetching data: $e");
      throw Exception("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFollowing();
    fetchProfile();
  }

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
      body: ListView.builder(
        itemCount: users.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return profile != null
                ? Column(
                    children: [
                      ProfileWidget(profile: profile!),
                    ],
                  )
                : SizedBox();
          } else {
            final user = users[index - 1];
            return PersonBox(user: user, fetchData: fetchFollowing);
          }
        },
      ),
    );
  }
}
