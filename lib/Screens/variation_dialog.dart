import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/models/products.dart';

import '../provider/products_provider.dart';

class VariationDialog extends StatefulWidget {
  const VariationDialog({Key? key}) : super(key: key);

  @override
  State<VariationDialog> createState() => _VariationDialogState();
}

class _VariationDialogState extends State<VariationDialog> {
  TextEditingController varnameEditingController = TextEditingController();
  TextEditingController varpriceEditingController = TextEditingController();
  TextEditingController varstockEditingController = TextEditingController();
  TextEditingController varbarcodeEditingController = TextEditingController();

  List<Products> productVariations = [];
  String pro1 = "";
  String pro2 = "";
  String pro3 = "";
  String pro4 = "";
  void addProductsToVar() {
    productVariations.add(Products(
        name: pro1,
        price: int.parse(pro2),
        barcode: pro3,
        stock: int.tryParse(pro4)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Dialog(
          child: ListView(
            children: [
              Text('     Product Name'),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                      width: double.infinity,
                      child: TextField(
                        onChanged: (text1) {
                          pro1 = text1;
                        },
                        controller: varnameEditingController,
                      ))),
              Text('     Product Price'),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                      width: double.infinity,
                      child: TextField(
                        onChanged: ((text2) {
                          pro2 = text2;
                        }),
                        controller: varpriceEditingController,
                      ))),
              Text('     Product Barcode'),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                      width: double.infinity,
                      child: TextField(
                        onChanged: ((text3) {
                          pro3 = text3;
                        }),
                        controller: varbarcodeEditingController,
                      ))),
              Text('     Product Stock'),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                      width: double.infinity,
                      child: TextField(
                        onChanged: ((text4) {
                          pro4 = text4;
                        }),
                        //onSubmitted: (value4) {},
                        controller: varstockEditingController,
                      ))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    value.addVarItem(Products(
                        name: pro1,
                        price: int.parse(pro2),
                        barcode: pro3,
                        stock: int.tryParse(pro4)));

                    // addProductsToVar();
                    print(value.list.first.name);
                  },
                  child: Text("save"))
            ],
          ),
        );
      },
    );
  }
}
