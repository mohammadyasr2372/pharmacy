// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/model/response/basket_model.dart';
import 'package:login_signup/service/basket_servce.dart';

class FutureBaskPage extends StatelessWidget {
  const FutureBaskPage({super.key});

  // dynamic tempCategry = Prodect_Service().serachCategory('2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ServiceBasket().showBasket(),
        builder: (context, snapshot) {
          if (snapshot.data is bool) {
            return Center(
              child: Text('No InterNet'.tr()),
            );
          } else if (snapshot.hasData) {
            dynamic tempBasket = snapshot.data;
            // late List<BasketMOdel> finalData;
            List<BasketMOdel> basketes = List.generate(tempBasket.length,
                (index) => BasketMOdel.fromMap(tempBasket[index]));
            // basketes.forEach((element) async {
            //   dynamic temp =
            //       await ServiceBasket().showPrice(id_bask: element.id);

            //   element.price_totale = PriceTotale.fromMap(temp);
            //                 print(element.price_totale);
            // });
            return BaskPage(
              baseket: basketes,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text('Error'.tr()),
            );
          }
        },
      ),
    );
  }
}

class BaskPage extends StatefulWidget {
  const BaskPage({super.key, required this.baseket});
  final List<BasketMOdel> baseket;
  @override
  State<BaskPage> createState() => _BaskPageState();
}

class _BaskPageState extends State<BaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
        // backgroundColor: Colors.white70,
        centerTitle: true,
        title: const Text(
          'Basket',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.baseket.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(widget.baseket.elementAt(index).id.toString()),
              ),
              trailing: Image.asset('assets/images/bask.png'),
              title: Text(
                '${widget.baseket.elementAt(index).order_status.status.tr()}\t\t\n${widget.baseket.elementAt(index).order_status.payment_status.tr()}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle:
                  Text(widget.baseket.elementAt(index).order_status.updated_at),
            );
          }),
    );
  }
}
