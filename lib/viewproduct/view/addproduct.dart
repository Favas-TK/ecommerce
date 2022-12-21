import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:seller_app/viewproduct/bloc/add_product_bloc.dart';

class AddProduct extends StatelessWidget {
  AddProduct({
    super.key,
    
  });
 

  final auth = FirebaseAuth.instance;
  late final XFile? img;

  Future<XFile?> getImage() async {
    final imagePicker = ImagePicker();

    img = await imagePicker.pickImage(source: ImageSource.gallery);
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  final _addproduct = AddProductBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addproduct,
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is ProductAddedSuccess) {
            Navigator.pop(context);
            MotionToast(
              icon: Icons.done,
              primaryColor: Colors.green,
              description: const Text(' successfully Added'),
            ).show(context);
          } else {
            MotionToast(
              icon: Icons.done,
              primaryColor: Colors.green,
              description: const Text(' Product Not Added'),
            ).show(context);
          }
        },
        child: Scaffold(
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
                  _addproduct.add(
                    ProductAddEvent(
                      name: productNameController.text,
                      description: productDescriptionController.text,
                      price: double.parse(productPriceController.text),
                      image: img!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
