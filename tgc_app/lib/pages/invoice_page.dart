import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tgc_app/config.dart';
import 'package:tgc_app/models/invoice.dart';
import 'package:tgc_app/widgets/app_bar.dart';
import 'package:tgc_app/widgets/empty.dart';
import 'package:tgc_app/widgets/on_tap_scale.dart';
import 'package:tgc_app/widgets/text_field.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key, this.invoice});
  final Invoice? invoice;

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Invoice invoice = Invoice(
    list: [],
    name: "Yangi mijoz",
    dateTime: DateTime.now(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.invoice != null) {
      setState(() {
        invoice = widget.invoice!;
      });
    }
    nameController.text = invoice.name;
    dateController.text = DateFormat(
      'dd.MM.yyyy hh:mm',
    ).format(invoice.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: nameController.text,
            subTitle: dateController.text,
            actions: [
              CustomAppBarAction(
                title: const Icon(
                  CupertinoIcons.floppy_disk,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                CustomTextField(
                  controller: nameController,
                  onChange: (val) {},
                  label: "Oluvchi",
                ),
                CustomTextField(
                  controller: dateController,
                  onChange: (val) {},
                  label: "Sana",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tovarlar:"),
                      const EmptyWidget(title: "Tovarlar yoq!"),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {},
                          color: primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.add,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Qo'shish",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
