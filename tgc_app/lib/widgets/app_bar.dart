// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tgc_app/config.dart';
import 'package:tgc_app/widgets/on_tap_scale.dart';

class CustomAppBarAction {
  Widget title;
  Function onTap;
  CustomAppBarAction({
    required this.title,
    required this.onTap,
  });
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.actions,
  });
  final String title;
  final String subTitle;
  final List<CustomAppBarAction> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            OnTapScaleAndFade(
              child: Container(
                height: 38,
                width: 38,
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            ...actions.map(
              (e) => OnTapScaleAndFade(
                onTap: () {
                  e.onTap();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: e.title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
