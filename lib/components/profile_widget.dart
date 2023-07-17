import 'package:flutter/material.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/model/profile.dart';
import 'package:mini_sosmed/pages/following_page.dart';
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
          const SizedBox(height: 5),
          CircleAvatar(
            radius: 35,
          ),
          const SizedBox(height: 5),
          Text(
            "${profile.name}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
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
                        builder: (context) => FollowersPage(
                            username: profile.username.toString()),
                      ),
                    );
                  },
                  child: Text(
                    "${profile.followers} Pengikutt",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 25),
              SizedBox(
                height: 25,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FollowingPage(
                            username: profile.username.toString()),
                      ),
                    );
                  },
                  child: Text(
                    "${profile.follows} Mengikuti",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          profile.id.toString() == Auth.userId
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Edit Image"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 30),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
