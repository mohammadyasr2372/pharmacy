// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

// import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/cart.dart';
import 'package:login_signup/model/response/medicine_model.dart';

import '../service/medicine_service.dart';

class MedicineDetailsPage extends StatefulWidget {
  final MedicineModel medicine;
  final int index;
  const MedicineDetailsPage({
    super.key,
    required this.medicine,
    required this.index,
    // required this.quantityy
  });

  @override
  State<MedicineDetailsPage> createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
  num counter = 0;
  void _incrementCounter() {
    setState(() {
      counter += 12;
    });
    counter = counter;
  }

  void _DecreaseCounter() {
    setState(() {
      if ((counter > 0)) counter -= 1;
      counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Details'.tr(),
          style: TextStyle(
              // color: Colors.black,
              fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.medicine.trade_name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Expanded(
              child: Hero(
                tag: widget.index,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                        '${Prodect_Service().baseUrl}${widget.medicine.image}')),
              ),
            ),
            //    Image.network(
            //     widget.medicine.image ,
            //     height: 160,
            //     width: 160,
            //   ),
            // ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Rochatte(
                      medicine: widget.medicine,
                    );
                  }),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: Card(
                        elevation: 25,
                        color: Colors.white60,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 26,
                                    ),
                                    GestureDetector(
                                      onTap: _DecreaseCounter,
                                      child: CircleAvatar(
                                        // backgroundColor:
                                        //     Color.fromARGB(211, 33, 144, 111),
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '$counter',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: _incrementCounter,
                                      child: CircleAvatar(
                                        // backgroundColor:
                                        //     Color.fromARGB(211, 33, 144, 111),
                                        child: Icon(
                                          Icons.add,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (counter == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('The counter is 0'.tr())),
                          );
                        } else {
                          // if (counter >=
                          //     widget.medicine.expiration_dates.last.quantity) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //         content: Text(
                          //             'the quantity is only ${widget.medicine.expiration_dates.last.quantity}')),
                          //   );
                          // } else {
                          //   // await  ServiceOrder().createOrder(orderModel: OrderModel(pharmacist_id: 1, medicine_id: widget.medicine.id, order_quantity: counter));

                          cart.add(Cart(
                              image:
                                  '${Prodect_Service().baseUrl}${widget.medicine.image}',
                              scientific_name: widget.medicine.scientific_name,
                              trade_name: widget.medicine.trade_name,
                              price: widget.medicine.price,
                              order_quantity: counter,
                              medicine_id: widget.medicine.id));
                          total_price += counter * widget.medicine.price;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content:
                                    Text('The cart has been created'.tr())),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 20,
                          // color: Color.fromARGB(211, 33, 144, 111),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      'Add to cart'.tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}

class Rochatte extends StatelessWidget {
  final MedicineModel medicine;

  const Rochatte({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Card(
            elevation: 16,
            // color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    title: Text(
                  'Company:'.tr() + medicine.company,
                  style: const TextStyle(fontSize: 16),
                )),
                ListTile(
                    title: Text(
                  'Trade Name:'.tr() + medicine.trade_name,
                  style: const TextStyle(fontSize: 16),
                )),
                ListTile(
                    title: Text(
                  'Scientific Name:'.tr() + medicine.scientific_name,
                  style: const TextStyle(fontSize: 16),
                )),
                ListTile(
                    title: Text(
                  'category name:'.tr() + medicine.category.name,
                  style: const TextStyle(fontSize: 16),
                )),
                // ListTile(
                //     title: Text(
                //   'Quantity: ${medicine.expiration_dates.last.quantity}',
                //   style: const TextStyle(fontSize: 16),
                // )),
                ListTile(
                    title: Text(
                  '${'Price:'.tr()}\$${medicine.price}',
                  style: const TextStyle(fontSize: 16),
                )),
                // ListTile(
                //   title: Text(
                //     'Totale Price: \$${medicine.price + 1}',
                //     style: const TextStyle(fontSize: 16),
                //   ),
                //   subtitle: Text('whith contect'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
