// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, use_build_context_synchronously, prefer_interpolation_to_compose_strings, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last, unused_import, avoid_function_literals_in_foreach_calls, use_key_in_widget_constructors, avoid_print, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/provider/favorite_medecines.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:login_signup/screens/Basepage.dart';
import 'package:login_signup/screens/page_medicine_details.dart';
import 'package:login_signup/service/medicine_service.dart';
import 'package:login_signup/service/base_service.dart';
import 'package:provider/provider.dart';

// import 'pr';
class WidjectGrid extends StatefulWidget {
  final List<MedicineModel> medicinies;
  final double? height;
  const WidjectGrid(
      {super.key, required this.medicinies, required this.height});

  @override
  State<WidjectGrid> createState() => _WidjectGridState();
}

class _WidjectGridState extends State<WidjectGrid> {
  // final Provider = Provider.of<FavoriteMadecines>(context) ;
  @override
  Widget build(BuildContext context) {
    final Pro = Provider.of<FavoriteMadecines>(context);
    return Builder(builder: (context) {
      return SizedBox(
        width: double.maxFinite,
        height: widget.height,
        child: GridView.builder(
          itemCount: widget.medicinies.length,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineDetailsPage(
                      medicine: widget.medicinies.elementAt(index),
                      index: index),
                ),
              );
            },
            child: Container(
              // color: Colors.grey,
              width: 100,
              height: 200,
              child: Column(children: [
                Hero(
                  tag: index,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(Prodect_Service().baseUrl +
                            widget.medicinies.elementAt(index).image),
                      ),
                    ),
                    width: 250,
                    height: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        widget.medicinies.elementAt(index).trade_name,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Color(0xFF1D1E20),
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.04,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Pro.toggleFavorite(
                              widget.medicinies.elementAt(index));

                          // if (list_favorait
                          //     .contains(widget.medicinies.elementAt(index))) {
                          //   list_favorait
                          //       .remove(widget.medicinies.elementAt(index));
                          // } else {
                          //   list_favorait.add(widget.medicinies.elementAt(index));
                          // }
                          setState(() {});
                        },
                        child: Provider.of<FavoriteMadecines>(context)
                                .isExist(widget.medicinies.elementAt(index))
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border)
                        // active_favorite(
                        //     index, widget.search_result),
                        ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.medicinies.elementAt(index).scientific_name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF1D1E20),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$' +
                              widget.medicinies
                                  .elementAt(index)
                                  .price
                                  .toString(),
                          style: TextStyle(
                            color: Color(0xFF1D1E20),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 3,
              mainAxisSpacing: 20,
              // crossAxisCount: 2,
              crossAxisSpacing: 30),
        ),
      );
    });
  }
}
