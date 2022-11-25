// import 'package:flutter/material.dart';
// import 'package:seller_app/productmodel.dart';


// class ScreenProduct extends StatefulWidget {
//   ScreenProduct({Key? key, required this.productAxis}) : super(key: key);
//   Products productAxis;

//   @override
//   State<ScreenProduct> createState() => _ScreenProductState();
// }

// class _ScreenProductState extends State<ScreenProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xfffefefe),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.black45,
//         ),
//         actions: const [
//           Icon(
//             Icons.search_rounded,
//             color: Colors.black45,
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Icon(
//             Icons.favorite_border_rounded,
//             color: Colors.black45,
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Icon(
//             Icons.shopping_cart,
//             color: Colors.black45,
//           ),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//       body: ListView(
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               AspectRatio(
//                 aspectRatio: 1,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 65, vertical: 10),
//                   // decoration: const BoxDecoration(color: Colors.teal),
//                   child: Hero(
//                       tag: (widget.productAxis.hashCode),
//                       child: Image.network(widget.productAxis.image!)),
//                 ),
//               ),
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 280),
//                   child: Text(
//                     widget.productAxis.name!,
//                     style: const TextStyle(
//                       color: Colors.black54,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 210),
//                 child: Text(
//                   widget.productAxis.discription!,
//                   style: const TextStyle(color: Colors.black, fontSize: 15),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 310),
//                 child: Text(
//                   widget.productAxis.price!,
//                   style: const TextStyle(color: Colors.black45, fontSize: 20),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   color: const Color(0xfff2f2f2),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               "Delivery Details",
//                               style: TextStyle(color: Colors.black),
//                             )),
//                         trailing: TextButton(
//                             onPressed: () {},
//                             child: const Text("Check deliver dare")),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   color: const Color(0xfff2f2f2),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               "Bank Offers",
//                               style: TextStyle(color: Colors.black),
//                             )),
//                         trailing: TextButton(
//                             onPressed: () {}, child: const Text("more")),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   color: const Color(0xfff2f2f2),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               "Product Details",
//                               style: TextStyle(color: Colors.black),
//                             )),
//                         trailing: TextButton(
//                             onPressed: () {}, child: const Text("more")),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 100),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           color: const Color(0xfff2f2f2),
//                           child: Column(
//                             children: [
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.share))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: const Color(0xfff2f2f2),
//                         child: Column(
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.favorite_border_rounded))
//                           ],
//                         ),
//                       ),
//                       Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: const Color(0xff5f7d89),
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.shopping_bag_outlined,
//                                   color: Colors.white,
//                                 )),
//                             const Text("Add to bag")
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
