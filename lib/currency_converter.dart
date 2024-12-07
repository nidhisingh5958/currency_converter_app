import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  CurrencyConverterMaterialPage({super.key}) {
    debugPrint('constructor');
  }

  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuilt');

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 152, 211),
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: const Color.fromARGB(255, 23, 186, 218),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              //button

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) *
                          84; //conversion rate
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 94, 23, 218),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*alternative code for button
style: ButtonStyle(
    backgroundColor:(Color.fromARGB(255, 94, 23, 218)),
    foregroundColor: (Colors.white),
    minimumSize:(Size(double.infinity, 50),
        ),
        (RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        )),
    ),*/