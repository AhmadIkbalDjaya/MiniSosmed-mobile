import 'package:flutter/material.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';
import 'package:mini_sosmed/pages/profile_page.dart';
import 'package:mini_sosmed/pages/search_page.dart';

class MinsosBottomAppBar extends StatelessWidget {
  MinsosBottomAppBar({
    super.key,
  });
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 0,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              OutlinedButton(
                onPressed: () {
                  if (searchController.text == '') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(title: Text("Search wajib di isi"));
                      },
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchPage(query: searchController.text),
                      ),
                    );
                    // SearchPage(query: searchController.text);
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SearchPage(query: 'a'),
                  //   ),
                  // );
                },
                child: Text("Search"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, // Warna teks putih
                  side: BorderSide(color: Colors.white), // Border warna putih
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomaPage(),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.home,
                  size: 22,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    username: "ahmad-ikbal-djaya",
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.person,
                  size: 22,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.logout,
                  size: 22,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
