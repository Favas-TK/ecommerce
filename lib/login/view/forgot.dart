import 'package:flutter/material.dart';

class Forget extends StatelessWidget {
  const Forget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('forget password'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.lightBlue,
                      border: OutlineInputBorder(),
                      labelText: 'enter your email',
                      hintText: 'enter e-mail',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.lightBlue,
                      border: OutlineInputBorder(),
                      labelText: 'enter password',
                      hintText: 'enter new password',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.lightBlue,
                      border: OutlineInputBorder(),
                      labelText: 're enter password',
                      hintText: 're-enter your password',
                    ),
                  ),
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: const Text(' Change Password'),
                  onPressed: () {},
                ),
              ],
            ),),);
  }
}
