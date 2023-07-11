import 'package:flutter/material.dart';
import 'package:mini_sosmed/model/profile.dart';
import 'package:mini_sosmed/pages/follow_page.dart';
import 'package:mini_sosmed/pages/followers_page.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Image.network(
              "https://picsum.photos/536/354",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          CircleAvatar(
            radius: 35,
          ),
          SizedBox(height: 5),
          Text(
            "${profile.name}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FollowPage(),
                      ),
                    );
                  },
                  child: Text(
                    "${profile.followers} Pengikutt",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
              SizedBox(
                height: 25,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FollowersPage(),
                      ),
                    );
                  },
                  child: Text(
                    "${profile.follows} Pengikut",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Edit Image"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
