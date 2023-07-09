import 'package:flutter/material.dart';
import 'package:mini_sosmed/pages/login_page.dart';

class MinsosAppBar extends StatefulWidget implements PreferredSizeWidget {
  // final AppBar appBar;
  MinsosAppBar({super.key});

  @override
  State<MinsosAppBar> createState() => _MinsosAppBarState();
  @override
  // Size get preferredSize => Size.fromHeight(230);
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class _MinsosAppBarState extends State<MinsosAppBar> {
  bool showBottomAppBar = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                          onPressed: () {},
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
                            builder: (context) => LoginPage(),
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
                            builder: (context) => LoginPage(),
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
              preferredSize: Size.fromHeight(575),
              // preferredSize: Size.fromHeight(appBar.preferredSize.height),
            )
          : null,
    );
  }
}
