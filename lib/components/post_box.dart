import 'package:flutter/material.dart';
import 'package:mini_sosmed/components/comment_box.dart';
import 'package:mini_sosmed/controller/PostContoller.dart';
import 'package:mini_sosmed/model/posts.dart';

class PostBox extends StatefulWidget {
  const PostBox({super.key, required this.post, required this.fetchPost});
  final Posts post;
  final Function fetchPost;

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  bool showComent = false;
  final postController = PostContoller();
  final bodyController = TextEditingController();
  final commentController = TextEditingController();

  Future<void> deletePost(String id) async {
    try {
      await postController.delete(id);
      // widget.fetchPost();`
    } catch (e) {
      print("Error deleting Post: $e");
    }
  }

  Future<dynamic> commentPost(String id) async {
    final String body = commentController.text;
    commentController.clear();
    try {
      var result = await postController.comment(id, body);
      print(result);
    } catch (error) {
      return null;
    }
  }

  Future<bool> updatePost(String id) async {
    String body = bodyController.text;
    // bodyController.clear();
    try {
      await postController.update(id, body);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> likePost(String id) async {
    try {
      await postController.like(id);
      // widget.fetchPost();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    bodyController.text = widget.post.body.toString();
  }

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
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                          child: Container(
                                            height: 350,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 15),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Header
                                                Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Edit Postingan",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon: Icon(
                                                            Icons.close,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                  ],
                                                ),
                                                // body
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CircleAvatar(),
                                                        SizedBox(width: 10),
                                                        Expanded(
                                                          child: Text(
                                                              "Ahmad Ikbal Djaya"),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                        "Apa yang sedang anda pikirkan?"),
                                                    SizedBox(height: 10),
                                                    TextField(
                                                      controller:
                                                          bodyController,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: null,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text("Upload Gambar"),
                                                  ],
                                                ),
                                                // footer
                                                Column(
                                                  children: [
                                                    Divider(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("Close"),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            // storePost();
                                                            updatePost(
                                                              widget.post.id
                                                                  .toString(),
                                                            );
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            widget.fetchPost();
                                                          },
                                                          child: Text("Edit"),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
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
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      deletePost(post.id.toString());
                                      widget.fetchPost();
                                      Navigator.pop(context);
                                    },
                                    child: Container(
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
                GestureDetector(
                  onTap: () {
                    // print("tes");
                    likePost(post.id.toString());
                    widget.fetchPost();
                  },
                  child: Row(
                    children: [
                      Icon(
                        post.hasLike == 1
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined,
                      ),
                      Text(" ${post.likeCount} Like"),
                    ],
                  ),
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
                      Text(" ${post.commentCount} Comment"),
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
                              controller: commentController,
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
                            onPressed: () {
                              commentPost(post.id.toString());
                              widget.fetchPost();
                            },
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
