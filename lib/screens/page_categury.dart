// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable, non_constant_identifier_names, prefer_interpolation_to_compose_strings, sized_box_for_whitespace
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:login_signup/screens/Basepage.dart';
import 'package:login_signup/service/medicine_service.dart';
import '../widgets/widgect_grid.dart';

class PageCategury extends StatefulWidget {
  PageCategury({
    super.key,
    required this.title,
    required this.prodect_categures,
  });
  final List<MedicineModel> prodect_categures;
  final String title;
  List<MedicineModel> prodect_search = [];
  @override
  State<PageCategury> createState() => _PageCateguryState();
}

class _PageCateguryState extends State<PageCategury> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: Text(widget.title)),
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
                        await Prodect_Service().serachMedicine(value);
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
                        child: Icon(Icons.search),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintText: 'Search ...'.tr(),
                      border: InputBorder.none),
                ),
              ),
            ),
            Align(
              alignment: (context.locale.languageCode == 'en')
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.prodect_categures.length.toString() + ' Items'.tr(),
                  style: TextStyle(
                    // color: Color(0xFF1D1E20),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    // height: 0.06,
                  ),
                ),
              ),
            ),
            WidjectGrid(
                medicinies: (search.text.isEmpty)
                    ? widget.prodect_categures
                    : widget.prodect_search,
                height: 700)
          ],
        ),
      ),
    );
  }
}
