import 'package:flutter/material.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/controller/LoginRegisController.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';
import 'package:mini_sosmed/pages/profile_page.dart';
import 'package:mini_sosmed/pages/search_page.dart';

class MinsosBottomAppBar extends StatelessWidget {
  MinsosBottomAppBar({
    super.key,
  });
  final searchController = TextEditingController();
  final loginController = LoginRegisController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      contentPadding: const EdgeInsets.symmetric(
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
              const SizedBox(width: 5),
              OutlinedButton(
                onPressed: () {
                  if (searchController.text == '') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                            title: Text("Search wajib di isi"));
                      },
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchPage(query: searchController.text),
                      ),
                    );
                    // SearchPage(query: searchController.text);
                  }
                },
                child: const Text("Search"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, // Warna teks putih
                  side: const BorderSide(
                      color: Colors.white), // Border warna putih
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomaPage(),
                ),
              );
            },
            child: const Row(
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
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    username: "${Auth.username}",
                  ),
                ),
              );
            },
            child: const Row(
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
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              loginController.logout();
              Auth.resetAuth();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Row(
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
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
