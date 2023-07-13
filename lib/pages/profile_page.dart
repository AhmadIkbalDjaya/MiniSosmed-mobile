import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/components/about_us.dart';
import 'package:mini_sosmed/components/bio.dart';
import 'package:mini_sosmed/components/create_post_box.dart';
import 'package:mini_sosmed/components/minsos_bottom_app_bar.dart';
import 'package:mini_sosmed/components/post_box.dart';
import 'package:mini_sosmed/components/profile_widget.dart';
import 'package:mini_sosmed/controller/UserController.dart';
import 'package:mini_sosmed/model/posts.dart';
import 'package:mini_sosmed/model/profile.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});
  final String username;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showBottomAppBar = false;
  final userController = UserContoller();
  Profile? profile;
  // final String username = widget.username;
  List<Posts> posts = [];

  Future<void> fetchUserPost([String? username]) async {
    try {
      List<Posts> fetchPost =
          await userController.postsUser(username ?? widget.username);
      setState(() {
        posts = fetchPost;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProfile(widget.username);
    fetchUserPost(widget.username);
  }

  Future<void> fetchProfile(String username) async {
    try {
      Profile fetchProfileData = await userController.profileUser(username);
      setState(() {
        profile = fetchProfileData;
        // print(profile);
      });
    } catch (e) {
      // print("Error fetching data: $e");
      throw Exception("Error fetching data: $e");
    }
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
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return profile != null
                ? Column(
                    children: [
                      ProfileWidget(profile: profile!),
                      SizedBox(height: 25),
                      BioBox(profile: profile!),
                      SizedBox(height: 10),
                      AboutUs(),
                      SizedBox(height: 50),
                      profile!.id.toString() == Auth.user_id
                          ? CreatePostBox(fetchPost: fetchUserPost)
                          : SizedBox(),
                    ],
                  )
                : SizedBox();
          } else {
            final post = posts[index - 1];
            return PostBox(post: post, fetchPost: fetchUserPost);
          }
        },
      ),
    );
  }
}
