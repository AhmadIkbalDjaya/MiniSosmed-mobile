import 'package:flutter/material.dart';
import 'package:mini_sosmed/components/person_box.dart';
import 'package:mini_sosmed/controller/UserController.dart';
import 'package:mini_sosmed/model/users.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';
import 'package:mini_sosmed/pages/profile_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool showBottomAppBar = false;
  final controller = UserContoller();
  List<Users> users = [];

  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  Future<void> searchUser(String query) async {
    try {
      List<Users> fetchUsers = await controller.searchUser(query);
      setState(() {
        users = fetchUsers;
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: TextField(
                                onChanged: (value) {
                                  // setState(() {
                                  //   search = searchController.value.toString();
                                  // });
                                },
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
                              print(searchController.text);
                              setState(() {
                                searchUser(searchController.text);
                              });
                              // print(searchController.value);
                              // searchController(value);
                            },
                            child: Text("Search"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white, // Warna teks putih
                              side: BorderSide(
                                  color: Colors.white), // Border warna putih
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
                              builder: (context) => ProfilePage(),
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
                ),
                preferredSize: Size.fromHeight(175),
              )
            : null,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          // print(users);
          final user = users[index];
          // return Text("${user.username}");
          return PersonBox(user: user);
          // return Coba(user: user);
        },
      ),
    );
  }
}
