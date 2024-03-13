// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, use_build_context_synchronously, prefer_interpolation_to_compose_strings, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last, unused_import, avoid_function_literals_in_foreach_calls, use_key_in_widget_constructors, avoid_print, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/response/categry_model.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:login_signup/screens/Basepage.dart';
import 'package:login_signup/screens/page_categury.dart';
import 'package:login_signup/screens/page_serch.dart';
import 'package:login_signup/service/medicine_service.dart';
import 'package:login_signup/widgets/widgect_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page_all_gategry.dart';

class Home extends StatelessWidget {
  // dynamic tempCategry = Prodect_Service().serachCategory('2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Prodect_Service().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.data is bool) {
            return Center(
              child: Text('No InterNet'.tr()),
            );
          } else if (snapshot.hasData) {
            dynamic tempProdects = snapshot.data;
            List<CategryModel> categories = List.generate(tempCategry.length,
                (index) => CategryModel.fromMap(tempCategry[index]));
            List<MedicineModel> prodects = List.generate(tempProdects.length,
                (index) => MedicineModel.fromMap(tempProdects[index]));

            return PageHome(
              prodects: prodects,
              categories: categories,
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

class PageHome extends StatefulWidget {
  PageHome({
    super.key,
    // required this.prodect_categures,
    required this.prodects,
    required this.categories,
  });

  List<MedicineModel> prodect_categures = [];
  List<MedicineModel> prodect_search = [];
  final List<MedicineModel> prodects;
  final List<CategryModel> categories;

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: (context.locale.languageCode == 'en')
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 28,
                right: 8,
                left: 8,
                bottom: 8,
              ),
              child: Text(
                'Hello'.tr(),
                style: TextStyle(
                  // color: Color(0xFF8F959E),
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 0.04,
                  letterSpacing: -0.21,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: search,
                onChanged: (value) async {
                  config
                      .get<SharedPreferences>()
                      .setString('Last Serch', value);
                  dynamic temp = await Prodect_Service().serachMedicine(value);
                  widget.prodect_search = List.generate(temp.length,
                      (index) => MedicineModel.fromMap(temp[index]));
                  setState(() {});
                  // setState(() {
                  //   widget.prodect_categures.clear();
                  //   widget.prodects.forEach((element) {
                  //     if (element.scientific_name.contains(value) ||
                  //         element.category.name.contains(value)) {
                  //       widget.prodect_categures.add(element);
                  //     }
                  //   });
                  // });
                },
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 10),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (contaxt) => PageSerch(
                                  prodects: widget.prodects,
                                  index: 2,
                                  prodect_categures: widget.prodect_categures,
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.search)),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintText: 'Search ...'.tr(),
                    border: InputBorder.none),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Choose Categury'.tr(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contaxt) => PageAllGategry(widget: widget),
                        ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 15,
                      child: Center(
                        child: Text(
                          'View All'.tr(),
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 55,
              child: ListView.builder(
                  itemCount: widget.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, inde) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 5.0, top: 10, bottom: 10),
                      child: InkWell(
                          onTap: () async {
                            dynamic temp = await Prodect_Service()
                                .getProductofcategory(
                                    id_category:
                                        widget.categories[inde].id.toString());
                            widget.prodect_categures = List.generate(
                                temp.length,
                                (index) => MedicineModel.fromMap(temp[index]));
                            setState(() {});
                            // setState(() {
                            //   widget.prodect_categures.clear();
                            //   widget.prodects.forEach((element) {
                            //     if (element.category.name
                            //         .contains(categories[inde].name)) {
                            //       widget.prodect_categures.add(element);
                            //     }
                            //   });
                            // });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageCategury(
                                  title: widget.categories[inde].name,
                                  prodect_categures: widget.prodect_categures,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 115,
                            height: 50,
                            child: Center(
                              child: Text(
                                widget.categories.elementAt(inde).name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Medecienes'.tr(),
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (Context) => PageCategury(
                              title: 'All prodect',
                              prodect_categures: widget.prodects,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 15,
                        child: Center(
                          child: Text(
                            'View All'.tr(),
                            style: TextStyle(
                              color: Color(0xFF8F959E),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
          WidjectGrid(
            height: 500,
            medicinies:
                (search.text.isEmpty) ? widget.prodects : widget.prodect_search,
          )
        ],
      ),
    );
  }
}
