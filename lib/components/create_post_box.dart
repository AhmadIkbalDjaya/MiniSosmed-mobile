import 'package:flutter/material.dart';

class CreatePostBox extends StatelessWidget {
  const CreatePostBox({
    super.key,
  });

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
                                    onPressed: () {},
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
