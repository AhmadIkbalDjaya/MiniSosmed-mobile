import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mini_sosmed/controller/PostContoller.dart';
import 'package:mini_sosmed/pages/home_page.dart';

class CreatePostBox extends StatefulWidget {
  CreatePostBox({super.key, required this.fetchPost});
  final Function fetchPost;

  @override
  State<CreatePostBox> createState() => _CreatePostBoxState();
}

class _CreatePostBoxState extends State<CreatePostBox> {
  final postContoller = PostContoller();

  final bodyController = TextEditingController();

  Future<bool> storePost() async {
    String body = bodyController.text;

    bodyController.clear();

    try {
      bool result = await postContoller.post(body);
      print(result);
      return true;
    } catch (error) {
      print('Error while post: $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      height: 350,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Header
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Buat Postingan",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text("Ahmad Ikbal Djaya"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("Apa yang sedang anda pikirkan?"),
                              SizedBox(height: 10),
                              TextField(
                                controller: bodyController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Close"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      storePost();
                                      Navigator.of(context).pop();
                                      widget.fetchPost();
                                    },
                                    child: Text("Posting"),
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
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  "Apa yang anda pikirkan, Ahmad Ikbal Djaya?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
