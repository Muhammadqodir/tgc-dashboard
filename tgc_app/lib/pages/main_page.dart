import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tgc_app/config.dart';
import 'package:tgc_app/pages/invoice_page.dart';
import 'package:tgc_app/widgets/on_tap_scale.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Image.asset(
                    "res/logo_white.png",
                    width: 40,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "TGC",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  const Expanded(child: SizedBox()),
                  OnTapScaleAndFade(
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InvoicePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                Text("data"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
