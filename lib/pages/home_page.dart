import 'package:flutter/material.dart';
import 'package:mini_sosmed/components/minsos_bottom_app_bar.dart';
import 'package:mini_sosmed/components/create_post_box.dart';
import 'package:mini_sosmed/components/post_box.dart';
import 'package:mini_sosmed/controller/PostContoller.dart';
import 'package:mini_sosmed/model/posts.dart';

class HomaPage extends StatefulWidget {
  HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  bool showBottomAppBar = false;
  final postController = PostContoller();
  List<Posts> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  Future<void> fetchPost() async {
    try {
      List<Posts> fetchPost = await postController.get();
      setState(() {
        posts = fetchPost;
      });
    } catch (error) {
      print('Error fetching data: $error');
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ListView.builder(
          itemCount: posts.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return CreatePostBox(fetchPost: fetchPost);
              // return CreatePostBox();
            } else {
              final post = posts[index - 1];
              return PostBox(post: post, fetchPost: fetchPost);
            }
          },
        ),
      ),
    );
  }
}
