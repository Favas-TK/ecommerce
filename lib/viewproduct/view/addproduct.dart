import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:uuid/uuid.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final auth = FirebaseAuth.instance;
  late final XFile? img;

  Future<XFile?> getImage() async {
    final imagePicker = ImagePicker();

    img = await imagePicker.pickImage(source: ImageSource.gallery);
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add product'),
      ),
      body: ListView(
        children: [
          const Text(
            'add items',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          TextButton(
            onPressed: getImage,
            child: const Text('Upload photo'),
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
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textColor: Colors.white,
            color: Colors.blue,
            child: const Text('add item'),
            onPressed: () {
              createProduct(
                productName: productNameController.text,
                productDescription: productDescriptionController.text,
                productPrice: productPriceController.text,
                image: img,
              );
              Navigator.pop(context);
              MotionToast(
                icon: Icons.done,
                primaryColor: Colors.green,
                description: const Text(' successfully Added'),
              ).show(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> createProduct({
    required String productName,
    required String productDescription,
    required String productPrice,
    required XFile? image,
  }) async {
    final productRef = FirebaseFirestore.instance.collection('product_data');

    final auth = FirebaseAuth.instance;
    final userid = auth.currentUser!.uid;
    const uuid = Uuid();
    final productId = uuid.v4();

    final reference =
        FirebaseStorage.instance.ref().child('image').child(image!.name);
    final file = File(image.path);
    await reference.putFile(file);
    final imageLink = await reference.getDownloadURL();

    final datetime = DateTime.now();
    final time = '${datetime.hour}:${datetime.minute}pm';
    try {
      await productRef.doc(productId).set({
        'image': imageLink,
        'productName': productName,
        'description': productDescription,
        'price': productPrice,
        'userid': userid,
        'productid': productId,
        'date': time,
      });
    } catch (e) {}
  }
}