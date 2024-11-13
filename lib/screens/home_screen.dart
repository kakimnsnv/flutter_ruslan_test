// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController dateTimeController = TextEditingController(text: "05 нояб. 2024, 23:53");
  final TextEditingController receiptController = TextEditingController(text: "KGTP65128183/10398036323");
  final TextEditingController cardController = TextEditingController(text: "4169•58••••••••");
  final TextEditingController providerController = TextEditingController(text: "MBANK");
  final TextEditingController accountNumberController = TextEditingController(text: "99655522");
  final TextEditingController amountController = TextEditingController(text: "1 200,00");
  final TextEditingController feeController = TextEditingController(text: "12,00");
  final TextEditingController totalController = TextEditingController(text: "1 212,00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Чек по операции"),
        leading: IconButton(
          onPressed: () {
            print("Back");
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download), // при желании можно svgpicture, image.asset, image.network, cachednetworkimage использовать и тд
            onPressed: () {
              print("Download"); // TODO: Implement download
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    _buildEditableField("Дата и время", dateTimeController),
                    const Divider(),
                    _buildEditableField("Квитанция", receiptController),
                    const Divider(),
                    _buildEditableField("Откуда", cardController),
                    const Divider(),
                    _buildEditableField("Поставщик услуг", providerController),
                    const Divider(),
                    _buildEditableField("Номер счета", accountNumberController),
                    const Divider(),
                    _buildEditableField("Сумма", amountController, suffixText: "KGS"),
                    const Divider(),
                    _buildEditableField("Комиссия", feeController, suffixText: "KGS"),
                    const Divider(),
                    _buildEditableField("Сумма с учетом комиссии", totalController, suffixText: "KGS"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid");
                  } else {
                    print("Form is invalid");
                  }
                },
                child: const Text("Поделиться"),
              ),
              TextButton(
                onPressed: () {
                  print("Cancel");
                },
                child: const Text("Вернуться"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, {String? suffixText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
        suffixText: suffixText,
        suffixStyle: const TextStyle(color: Colors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
