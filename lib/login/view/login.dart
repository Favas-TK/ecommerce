import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/dashboard/dashboard.dart';
import 'package:seller_app/login/view/forgot.dart';
import 'package:seller_app/signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                //  Container(
                //   alignment: Alignment.center,
                //   padding: const EdgeInsets.all(10),
                //     child:const NetworkImage(

                //            'https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png',

                //    ),
                // ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: mailController,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined),
                      // suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          // color:  selected == Gender.Email ? enabledtxt : deaible,
                          ),
                    ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(32),
                    //       ),
                    //       labelText: 'Mail_ID',
                    //     ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const []),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Forget(),
                      ),
                    );
                  },
                  child: const Text('Forgot Password'),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: const Text('Login'),
                  onPressed: () async {
                    final auth = FirebaseAuth.instance;
                    try {
                      await auth.signInWithEmailAndPassword(
                        email: mailController.text,
                        password: passwordController.text,
                      );

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('invalid email or password')));
                      // print(e.code);
                      // print('login failed');
                    }
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        child: const Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text('OR'),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        child: const Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.whatsapp),
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.facebook),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                ),
                const SizedBox(
                  height: 150,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have an account'),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ),
                            );
                          },
                          child: const Text(
                            'Register',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
