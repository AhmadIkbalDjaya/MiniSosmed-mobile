import 'package:flutter/material.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/controller/UserController.dart';
import 'package:mini_sosmed/model/users.dart';
import 'package:mini_sosmed/pages/profile_page.dart';

class PersonBox extends StatelessWidget {
  PersonBox({super.key, required this.user, required this.fetchData});
  final Function fetchData;
  final Users user;
  final userController = UserContoller();

  Future<dynamic> follow(String username) async {
    try {
      await userController.followUser(username);
    } catch (e) {
      print("Error deleting Post: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 3,
            )
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 25),
              SizedBox(width: 15),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(username: user.username.toString()),
                          ),
                        );
                      },
                      child: Text(
                        "${user.name}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("${user.followers} Pengikut"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          user.id.toString() != Auth.userId
              ? ElevatedButton(
                  onPressed: () {
                    follow(user.username.toString());
                    fetchData();
                  },
                  child: Text(user.hasFollow == false ? "Follow" : "Unfollow"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
