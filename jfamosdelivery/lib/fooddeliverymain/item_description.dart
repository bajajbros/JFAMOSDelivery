// import 'package:flutter/material.dart';
// import 'package:fooddeliveryapp/models/popularitems.dart';
// import 'item.dart';

// class ItemDescription extends StatelessWidget {
//   final PopularItems? item;

//   const ItemDescription({Key? key, @required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 24.0, right: 24.0, bottom: 24.0, top: 48.0),
//               child: Row(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                         width: 45,
//                         height: 45,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(15),
//                           ),
//                         ),
//                         child: const Icon(
//                           Icons.keyboard_arrow_left,
//                           color: Colors.black,
//                           size: 28,
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: SizedBox(
//                 height: 120,
//                 child: Hero(
//                   tag: item!.pName.toString(),
//                   child: Image.network(
//                     'www.jfamoslogistics.com/images/${item!.pName}',
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 32.0,
//             ),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(50),
//                     topRight: Radius.circular(50),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(32.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         item!.pName.toString(),
//                         style: const TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const Text(
//                         '',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 24.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Container(
//                                   width: 48,
//                                   height: 48,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[200],
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(15),
//                                       bottomLeft: Radius.circular(15),
//                                     ),
//                                   ),
//                                   child: const Icon(
//                                     Icons.remove,
//                                     color: Colors.black,
//                                   )),
//                               Container(
//                                 color: Colors.grey[200],
//                                 width: 48,
//                                 height: 48,
//                                 child: const Center(
//                                   child: Text(
//                                     "2",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                   width: 48,
//                                   height: 48,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[200],
//                                     borderRadius: const BorderRadius.only(
//                                       topRight: Radius.circular(15),
//                                       bottomRight: Radius.circular(15),
//                                     ),
//                                   ),
//                                   child: const Icon(
//                                     Icons.add,
//                                     color: Colors.black,
//                                   )),
//                             ],
//                           ),
//                          const Text(
//                             '',
//                             style:  TextStyle(
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 24.0,
//                       ),
//                       Expanded(
//                         child: SingleChildScrollView(
//                           physics: const BouncingScrollPhysics(),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: <Widget>[
//                               const Text(
//                                 "Product description",
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Text(
//                                 item!.description,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 24.0,
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Container(
//                             height: 72,
//                             width: 72,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: const BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                               border: Border.all(
//                                 color: item!.color,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Icon(
//                               Icons.favorite,
//                               color: item!.color,
//                               size: 36,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 16,
//                           ),
//                           Expanded(
//                             child: Container(
//                               height: 72,
//                               decoration: BoxDecoration(
//                                 color: item!.color,
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               child: const Center(
//                                 child: Text("Add to cart",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                     )),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
