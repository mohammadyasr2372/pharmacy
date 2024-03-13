// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/config/theme/theme_app.dart';
import 'package:login_signup/model/cart.dart';
import 'package:login_signup/model/provider/favorite_medecines.dart';
import 'package:login_signup/model/request/order_model.dart';
import 'package:login_signup/screens/Basepage.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/custom_scaffold.dart';

num total_price = 0;
// late num basket_id;
List<Cart> cart = [];
List<OrderModel> basket = [];
bool isDarkMood =
    config.get<SharedPreferences>().getBool('isDarkMood') ?? false;
dynamic tempCategry;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setup();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteMadecines(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: getThemeData(
            isLight: !(config.get<SharedPreferences>().getBool('isDarkMood') ??
                false)),
        home: const PageTemperary(),
      ),
    );
  }
}

class PageTemperary extends StatefulWidget {
  const PageTemperary({super.key});

  @override
  State<PageTemperary> createState() => _PageTemperaryState();
}

class _PageTemperaryState extends State<PageTemperary> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                (config.get<SharedPreferences>().getString('token') == null ||
                        config.get<SharedPreferences>().getString('token') ==
                            'logout')
                    ? WelcomeScreen()
                    : Basepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        child: Center(
          child: Text('   '),
        ),
      ),
    );
  }
}
