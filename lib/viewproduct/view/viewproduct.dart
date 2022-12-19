import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/detailedscreen/view/detailedscreen.dart';
import 'package:seller_app/viewproduct/view/addproduct.dart';


class Viewproduct extends StatelessWidget {
  Viewproduct({super.key});
  late CollectionReference productRef =
      FirebaseFirestore.instance.collection('product_data');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: const Text('view product'),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => AddProduct(),
            ),
          ),
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) {
          //     return Modaltextfield(
          //         // buttonName: 'Save',
          //         // buttonType: true,
          //         );
          //   },
          // );

          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(255, 217, 216, 212),
        body: StreamBuilder<QuerySnapshot>(
          stream: productRef
              .where('userid', isEqualTo: _auth.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final productItems = snapshot.data!.docs;
              child:
              return SingleChildScrollView(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
                    mainAxisExtent: 250,
                    // childAspectRatio: 50,
                  ),
                  itemCount: productItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            productAxis: productItems[index],
                          ),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Hero(
                            tag: productItems.hashCode,
                            child: Image.network(
                              productItems[index]['image'].toString(),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Text(productItems[index]['productName']
                                  .toString()),
                              Text(productItems[index]['description']
                                  .toString()),
                              Text(productItems[index]['price'].toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
