// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

// import 'package:flutter/material.dart';
// import 'package:login_signup/screens/Basepage.dart';

// TextEditingController title = TextEditingController();
// TextEditingController description = TextEditingController();
// TextEditingController price = TextEditingController();
// TextEditingController brand = TextEditingController();
// TextEditingController category = TextEditingController();
// TextEditingController thumbnail = TextEditingController();
// final _formSignInKey = GlobalKey<FormState>();

// class Add extends StatelessWidget {
//   const AddCart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('cart')),
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Flexible(
//           flex: 8,
//           child: Form(
//               key: _formSignInKey,
//               child: Column(
//                 children: [
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('the quintity is 50'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'quintity',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter quintity';
//                         }
//                         return null;
//                       },
//                       controller: title,
//                       decoration: InputDecoration(
//                           hintText: 'quintity',
//                           fillColor: Color(0xFFF5F6FA),
//                           filled: true,
//                           border: InputBorder.none),
//                     ),
//                   ),
//                 ],
//               )),
//         ),
//         Flexible(
//           flex: 1,
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.maxFinite,
//               height: 75,
//               decoration: BoxDecoration(color: Color(0xFF9775FA)),
//               // width: double.infinity,
//               child: InkWell(
//                 onTap: () async {
//                   if (_formSignInKey.currentState!.validate()) {
//                     print('asdsswesd');

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           backgroundColor: Colors.green,
//                           content: Text('The cart has been created')),
//                     );
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (e) => const Basepage(),
//                       ),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           backgroundColor: Color.fromARGB(255, 247, 162, 156),
//                           content: Text('Please try again')),
//                     );
//                   }
//                 },
//                 child: Center(
//                   child: const Text(
//                     'Add Order',
//                     style: TextStyle(
//                       color: Color(0xFFFEFEFE),
//                       fontSize: 17,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w500,
//                       height: 0.06,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
