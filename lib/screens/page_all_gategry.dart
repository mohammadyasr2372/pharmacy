// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, use_build_context_synchronously, prefer_interpolation_to_compose_strings, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last, unused_import, avoid_function_literals_in_foreach_calls, use_key_in_widget_constructors, avoid_print, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/model/response/categry_model.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:login_signup/screens/page_categury.dart';
import 'package:login_signup/screens/page_home.dart';
import 'package:login_signup/service/medicine_service.dart';

class PageAllGategry extends StatefulWidget {
  const PageAllGategry({
    super.key,
    required this.widget,
  });

  final PageHome widget;

  @override
  State<PageAllGategry> createState() => _PageAllGategryState();
}

class _PageAllGategryState extends State<PageAllGategry> {
  List<CategryModel> categry_serch = [];
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categuries'.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: search,
                  onChanged: (value) async {
                    dynamic temp =
                        await Prodect_Service().serachCategory(value);
                    categry_serch = List.generate(temp.length,
                        (index) => CategryModel.fromMap(temp[index]));
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
                        child: Icon(Icons.search),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintText: 'Search ...'.tr(),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: search.text.isEmpty
                    ? (widget.widget.categories.length)
                    : categry_serch.length,
                itemBuilder: (context, inde) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 5.0, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () async {
                        dynamic temp = await Prodect_Service()
                            .getProductofcategory(
                                id_category: (search.text.isEmpty
                                        ? (widget.widget.categories)
                                        : categry_serch)[inde]
                                    .id
                                    .toString());
                        widget.widget.prodect_categures = List.generate(
                            temp.length,
                            (index) => MedicineModel.fromMap(temp[index]));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageCategury(
                              title: (search.text.isEmpty
                                      ? (widget.widget.categories)
                                      : categry_serch)[inde]
                                  .name,
                              prodect_categures:
                                  widget.widget.prodect_categures,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(221, 163, 137, 243)),
                        width: 300,
                        height: 50,
                        child: Center(
                          child: Text(
                              (search.text.isEmpty
                                      ? (widget.widget.categories)
                                      : categry_serch)[inde]
                                  .name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
