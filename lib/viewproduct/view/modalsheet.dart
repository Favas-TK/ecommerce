import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:uuid/uuid.dart';

class Modaltextfield extends StatelessWidget {
  Modaltextfield({super.key});
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  final productRef = FirebaseFirestore.instance.collection('todo_data');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        margin: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'add items',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Upload photo'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextField(
              controller: productNameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 217, 212, 212),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Enter product name',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              controller: productDescriptionController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 217, 212, 212),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Enter product description.....',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              controller: productPriceController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 217, 212, 212),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Enter product price',
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textColor: Colors.white,
              color: Colors.blue,
              child: const Text('add item'),
              onPressed: () {
                MotionToast(
                  icon: Icons.done,
                  primaryColor: Colors.green,
                  description: const Text(' successfully Added'),
                ).show(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future <void>createProduct({
     required String productName,
    required String productDescription,
    required String productPrice,

  })async{
    final auth = FirebaseAuth.instance;
    final userid = auth.currentUser!.uid;
    const uuid = Uuid();
    final todoId = uuid.v4();

    final datetime = DateTime.now();
    final time = '${datetime.hour}:${datetime.minute}pm';
    try {
      await productRef.doc().set({
        'todoName': productName,
        'description': productDescription,
        'price': productPrice,
        'userid': userid,
        'todoid': todoId,
        'date': time,
    });
    } catch (e) {
      
    }
  }
   
  
}
