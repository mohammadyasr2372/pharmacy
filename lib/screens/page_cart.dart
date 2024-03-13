// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/request/order_model.dart';
import 'package:login_signup/service/basket_servce.dart';
import 'package:login_signup/service/order_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageCart extends StatefulWidget {
  const PageCart({super.key});

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(cart.elementAt(index).image),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  //  backgroundColor: Color.fromARGB(121, 102, 123, 117),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  title: Text(
                                    'Delete Medicine'.tr(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(
                                      'Are you Sure you want to remove Medicine'
                                          .tr()),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          cart.remove(cart.elementAt(index));
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Yes'.tr(),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No'.tr(),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold)))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    title: Text(
                      '${cart.elementAt(index).trade_name}       ${cart.elementAt(index).order_quantity}',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                        '\$${cart.elementAt(index).price * cart.elementAt(index).order_quantity} '),
                  );
                }),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(color: Color(0xFF9775FA)),
                    // width: double.infinity,
                    child: InkWell(
                      onTap: () async {
                        if (cart.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('The Basket is null'.tr())),
                          );
                        } else {
                          await ServiceBasket().createBasket();
                          // await Future.delayed(Duration(seconds: 5));
                          cart.forEach((element) async {
                            await ServiceOrder().createOrder(
                                orderModel: OrderModel(
                                    medicine_id: element.medicine_id,
                                    basket_id: config
                                        .get<SharedPreferences>()
                                        .getInt('Basket id')!,
                                    order_quantity: element.order_quantity));
                          });
                          await ServiceBasket().createStatusBasket();
                          // print(total_price.toString());
                          cart = [];
                          // print(cart);
                          total_price = 0;
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content:
                                    Text('The Basket has been created'.tr())),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Add Basket'.tr(),
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.06,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(color: Color(0xFF9775FA)),
                    // width: double.infinity,
                    child: Center(
                      child: Text(
                        '${'price total :'.tr()}$total_price',
                        style: TextStyle(
                          color: Color(0xFFFEFEFE),
                          // fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          // height: 0.06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
