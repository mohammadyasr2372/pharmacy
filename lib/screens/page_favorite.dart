// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, use_build_context_synchronously, prefer_interpolation_to_compose_strings, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last, unused_import, avoid_function_literals_in_foreach_calls, use_key_in_widget_constructors, avoid_print, file_names

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/provider/favorite_medecines.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:login_signup/screens/Basepage.dart';
import 'package:login_signup/screens/page_serch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgect_grid.dart';

TextEditingController Sersh = TextEditingController();

class PageFavorite extends StatefulWidget {
  PageFavorite({super.key});

  List<MedicineModel> list_favorait_Serch = [];
  @override
  State<PageFavorite> createState() => _PageFavorite();
}

class _PageFavorite extends State<PageFavorite> {
//   final list_favorite_madecines =
// Provider.of<FavoriteMadecines>(context).favoriteMadecines;
  @override
  Widget build(BuildContext context) {
    List list = Provider.of<FavoriteMadecines>(context).medicineModel;
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: Sersh,
                    // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => PageSerch()));
                    // },
                    // controller: search,
                    onChanged: (value) {
                      // config
                      //     .get<SharedPreferences>()
                      //     .setString('Last Serch', value);
                      widget.list_favorait_Serch.clear();
                      list.forEach((element) {
                        if (element.trade_name.contains(value) &&
                            element.category.name.contains(value)) {
                          widget.list_favorait_Serch.add(element);
                        }
                        setState(() {});
                      });
                    },
                    decoration: InputDecoration(
                        // fillColor: Color(0xFFF5F6FA),
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 10),
                          child: Icon(Icons.search),
                        ),
                        // floatingLabelAlignment:
                        //     FloatingLabelAlignment.center,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: 'Search ...'.tr(),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Favorite Arraival'.tr(),
                    style: TextStyle(
                      // color: Color(0xFF1D1E20),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0.06,
                    ),
                  ),
                ),
              ),
              WidjectGrid(
                  medicinies: (Sersh.text.isEmpty)
                      ? Provider.of<FavoriteMadecines>(context).medicineModel
                      : widget.list_favorait_Serch,
                  height: 525)
            ],
          ),
        );
      }),
    );
  }
}
