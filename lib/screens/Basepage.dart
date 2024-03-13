// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/response/user_model.dart';
import 'package:login_signup/service/user_service.dart';
import 'package:login_signup/widgets/custom_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'future_bask_page.dart';
import 'page_cart.dart';
import 'page_favorite.dart';
import 'page_home.dart';

// Future launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
//   }
int selectedIndex = 0;
TextEditingController search = TextEditingController();

class Basepage extends StatefulWidget {
  const Basepage({super.key});
// String user = config.get<SharedPreferences>().getString('user')!;
  @override
  State<Basepage> createState() => _BasepageState();
}

class _BasepageState extends State<Basepage> {
  UserModel userModel =
      UserModel.fromJson(config.get<SharedPreferences>().getString('user')!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            (selectedIndex == 2)
                ? 'Cart'.tr()
                : (selectedIndex == 1)
                    ? 'Favorite'.tr()
                    : userModel.phone_number,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          // backgroundColor: const Color.fromARGB(255, 76, 167, 240),
          // leading: Icon(Icons.notes_outlined),

          // title: (Text(
          //     config.get<SharedPreferences>().getString('phone').toString())),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contaxt) => const FutureBaskPage()));
                  },
                  child: const Icon(Icons.shopping_cart_checkout_outlined)),
            )
          ],
          centerTitle: true,
          elevation: 0,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        )),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      userModel.name,
                    ),
                    subtitle: Text(userModel.email),
                  ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SwitchListTile(
                value: isDarkMood,
                title: Text('Dark Mood'.tr()),
                // leading: Icon(Icons.home),
                onChanged: (val) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.red,
                        content:
                            Text('Please restare app to change Mode'.tr())),
                  );
                  setState(() {
                    isDarkMood = !isDarkMood;
                    config
                        .get<SharedPreferences>()
                        .setBool('isDarkMood', isDarkMood);
                  });
                },
              ),
              ListTile(
                title: Text('Home Page'.tr()),
                leading: const Icon(Icons.home),
                onTap: () {},
              ),
              ListTile(
                title: Text('languge'.tr()),
                leading: Icon(Icons.language_outlined),
                onTap: () {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(Locale('ar'));
                  } else {
                    context.setLocale(Locale('en'));
                  }
                },
              ),
              ListTile(
                title: Text('Account'.tr()),
                leading: Icon(Icons.account_balance_wallet_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text('order'.tr()),
                leading: Icon(Icons.account_box_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text('About Us'.tr()),
                leading: Icon(Icons.help),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contaxt) => PageAbout()));
                },
              ),
              ListTile(
                title: Text('cantact Us'.tr()),
                leading: Icon(Icons.phone_sharp),
                onTap: () {
                  // await launchURL(url);
                },
              ),
              ListTile(
                title: Text('log out'.tr()),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  await ServiceUser().logOut();
                  config.get<SharedPreferences>().setString('token', 'logout');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contaxt) => PageTemperary()));
                },
              ),
            ]),
          ),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.fastOutSlowIn,
          height: 50,
          backgroundColor: Colors.blue[200]!,
          // elevation: 0,
          // indicatorShape: CircleBorder(),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          // animationDuration: Duration(seconds: 3),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          /* selectedIndex: selectedIndex ,*/ items: const [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.shopping_cart_outlined)
          ],
          // destinations: [
          //   NavigationDestination(
          //       icon: Icon(Icons.home), label: 'HomePage'.tr()),
          //   NavigationDestination(
          //       icon: Icon(Icons.favorite), label: 'favorite'.tr()),
          //   NavigationDestination(
          //       icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'.tr())
          // ],
        ));
  }
}

List<Widget> pages = [Home(), PageFavorite(), PageCart()];
String value = '';

class PageAbout extends StatelessWidget {
  const PageAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: const [
                    TextSpan(
                        text: 'Engineer\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                        )),
                    TextSpan(
                        text: '\nAya Mutte',
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 20,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          // height: 0,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
