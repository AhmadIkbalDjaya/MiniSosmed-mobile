import 'package:flutter/material.dart';
import 'package:mini_sosmed/components/comment_box.dart';
import 'package:mini_sosmed/model/posts.dart';

class PostBox extends StatefulWidget {
  const PostBox({super.key, required this.post});
  final Posts post;

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  bool showComent = false;

  @override
  Widget build(BuildContext context) {
    final Posts post = widget.post;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          // header
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${post.name}"),
                        Text(
                          "${post.updatedAt}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15, top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              height: 135,
                              width: 900,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.edit),
                                        Text("Edit Postingan"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "Hapus Postingan",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          // body
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  "${post.body}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              post.image != null ? Image.network("${post.image}") : Container(),
            ],
          ),
          // like comment
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      post.hasLike == 1
                          ? Icons.thumb_up
                          : Icons.thumb_up_alt_outlined,
                    ),
                    Text("${post.likeCount} Like"),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showComent = !showComent;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.comment_outlined),
                      Text("${post.commentCount} Comment"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // comment
          Visibility(
            visible: showComent,
            child: Container(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      child: ListView(
                        children: post.comment
                                ?.map((comment) => CommentBox(comment: comment))
                                .toList() ??
                            [],
                      ),

                      // child: ListView.builder(
                      //   itemCount: post.commentCount,
                      //   itemBuilder: (context, index) {
                      //     final comment = post.comment[index];
                      //     return CommentBox(comment: comment);
                      //   },
                      // ),

                      // ListView(
                      //   children: [
                      //     CommentBox(),
                      //     CommentBox(),
                      //     CommentBox(),
                      //   ],
                      // ),
                    ),
                  ),
                  // comment form
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              // keyboardType: TextInputType.
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                hintText: "Tulis Komentar",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Comen"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
