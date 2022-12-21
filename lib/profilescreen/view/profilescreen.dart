import 'package:flutter/material.dart';
import 'package:seller_app/login/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ListTile(
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: const NetworkImage(
                    'https://www.denofgeek.com/wp-content/uploads/2019/02/mcu-1-iron-man.jpg?fit=1200%2C675',
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Stack(
                    children: const [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.edit, color: Colors.amber),
                      )
                    ],
                  ),
                ),
                const Text(
                  'saabu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'sabu@hotmail.com',
                  style: TextStyle(color: Colors.white38),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 60, right: 60, bottom: 60),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xfff4c209),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    child: const Text(
                      "Upgrade to PRO",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),

                      //1
                      child: Card(
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xff363636),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              title: const Text("privacy"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      //2
                      child: Card(
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xff363636),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.history_rounded,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              title: const Text("purchase history"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      //3
                      child: Card(
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xff363636),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.help_outline,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              title: const Text("Help & Support"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      //4
                      child: Card(
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xff363636),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              title: const Text("Setting"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      //5
                      child: Card(
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xff363636),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.person_add_alt_1,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              title: const Text("Invite a friend"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      //6
                      child: Card(
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xff363636),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              title: const Text("Logout"),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                  },
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
