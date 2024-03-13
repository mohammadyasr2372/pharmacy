// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, use_build_context_synchronously, prefer_interpolation_to_compose_strings, must_be_immutable, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgect_grid.dart';

class PageSerch extends StatefulWidget {
  const PageSerch(
      {super.key,
      required this.prodects,
      required this.prodect_categures,
      required this.index});

  final List<MedicineModel> prodects;
  final List<MedicineModel> prodect_categures;
  final int index;
  @override
  State<PageSerch> createState() => _PageSerchState();
}

class _PageSerchState extends State<PageSerch> {
  TextEditingController search = TextEditingController(
      text: config.get<SharedPreferences>().getString('Last Serch') ?? '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 275,
                height: 50,
                child: InkWell(
                  child: TextFormField(
                    controller: search,
                    onChanged: (value) async {
                      setState(() {
                        widget.prodect_categures.clear();
                        widget.prodects.forEach((element) {
                          if (element.scientific_name.contains(value) &&
                              element.category.name.contains(value)) {
                            widget.prodect_categures.add(element);
                          }
                        });
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
                        hintText: 'Search .....'.tr(),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            WidjectGrid(medicinies: widget.prodect_categures, height: 650)
          ],
        ),
      ),
    );
  }
}
