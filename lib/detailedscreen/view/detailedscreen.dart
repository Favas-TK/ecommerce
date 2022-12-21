import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller_app/detailedscreen/bloc/manage_product_bloc.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    required this.productAxis,
    // required this.name,
    // required this.description,
    // required this.price,
    // required this.productId,
    // required this.buttonType,
  });

  // String name;
  // String description;
  // String productId;
  // double price;
  // bool buttonType;
  var productAxis;
  final _manageprdct = ManageProductBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageprdct,
      child: BlocListener<ManageProductBloc, ManageProductState>(
        listener: (context, state) {
          if (state is ProductDeletedSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('successfully deleted'),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xfffefefe),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black45,
            ),
            actions: const [
              Icon(
                Icons.search_rounded,
                color: Colors.black45,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite_border_rounded,
                color: Colors.black45,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.black45,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 10),
                            // decoration: const BoxDecoration(color: Colors.teal),
                            child: Hero(
                              tag: productAxis.hashCode,
                              child: Image.network(
                                productAxis['image'].toString(),
                              ),
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              productAxis['productName'].toString(),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            productAxis['description'].toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            productAxis['price'].toString(),
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: const Color(0xfff2f2f2),
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit))
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: const Color(0xff5f7d89),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _manageprdct.add(
                                        DeleteProductEvent(
                                          productId: productAxis['productid']
                                              .toString(),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xfff2f2f2),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_rounded))
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff5f7d89),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            )),
                        const Text("Add to bag")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
