import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/login/login.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const ListTile(
              title: Text(
                'Register',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                'please enter details to register',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length <= 4) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (value == '') {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: mailController,
                decoration: const InputDecoration(
                  labelText: 'enter your mail',
                  hintText: 'mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (value == '') {
                    return 'Please enter mobile number';
                  }
                  return null;
                },
                controller: mobileController,
                decoration: const InputDecoration(
                  labelText: 'mobile number',
                  hintText: 'Mobile',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password should be more than 6 charrecters';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (passwordController.text != cPasswordController.text) {
                    return 'password must be same';
                  }
                  return null;
                },
                controller: cPasswordController,
                decoration: const InputDecoration(
                  labelText: 'confirm password',
                  hintText: 'confirm',
                ),
              ),
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: const Text('Register'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  createuser(
                    mailController.text,
                    passwordController.text,
                    nameController.text,
                    mobileController.text,
                    cPasswordController.text,
                    context,
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Processing Data'),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createuser(
    String email,
    String password,
    String username,
    String phonenumber,
    String cpassword,
    BuildContext context,
  ) async {
    final auth = FirebaseAuth.instance;
    final userRef = FirebaseFirestore.instance.collection('users');
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userRef.doc(auth.currentUser!.uid).set({
        'userid': auth.currentUser!.uid,
        'userName': username,
        'email': email,
        'password': password,
        'profileImage': '',
        'phonenumber': phonenumber,
        'cpassword': cpassword,
      });
      unawaited(
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code),
        ),
      );
    }
  }
}
