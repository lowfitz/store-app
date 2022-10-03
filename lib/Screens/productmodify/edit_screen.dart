import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Screens/widgets/form_product.dart';
import 'package:storeapp/models/products.dart';

import '../../provider/products_provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.products}) : super(key: key);
  final Products products;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  // TextEditingController nameEditingController = TextEditingController();
  // TextEditingController priceEditingController = TextEditingController();
  // TextEditingController stockEditingController = TextEditingController();
  // TextEditingController barcodeEditingController = TextEditingController();
  // @override
  // void initState() {
  //   nameEditingController.text = widget.products.name ?? "";
  //   priceEditingController.text = widget.products.price.toString();
  //   stockEditingController.text = widget.products.stock.toString();
  //   barcodeEditingController.text = widget.products.barcode.toString();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ProductsProvider>(context, listen: false);
    return FormProduct(
      list: [],
      isEdit: true,
      products: widget.products,
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text("Edit Product"),
    //   ),
    //   body: ListView(
    //     children: [
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Text('     Product Name'),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Card(
    //           margin: EdgeInsets.all(20),
    //           child: Container(
    //               width: double.infinity,
    //               child: TextField(
    //                 controller: nameEditingController,
    //               ))),
    //       Text('     Product Price'),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Card(
    //           margin: EdgeInsets.all(20),
    //           child: Container(
    //               width: double.infinity,
    //               child: TextField(
    //                 controller: priceEditingController,
    //               ))),
    //       Text('     Product Barcode'),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Card(
    //           margin: EdgeInsets.all(20),
    //           child: Container(
    //               width: double.infinity,
    //               child: TextField(
    //                 controller: barcodeEditingController,
    //               ))),
    //       Text('     Product Stock'),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Card(
    //           margin: EdgeInsets.all(20),
    //           child: Container(
    //               width: double.infinity,
    //               child: TextField(
    //                 controller: stockEditingController,
    //               ))),
    //       SizedBox(
    //         height: 30,
    //       ),
    //       Center(
    //         child: ElevatedButton(
    //           child: Text('Update'),
    //           onPressed: (() {
    //             provider.editData(context,
    //                 barcode: barcodeEditingController.text,
    //                 name: nameEditingController.text,
    //                 price: priceEditingController.text,
    //                 stock: stockEditingController.text,
    //                 id: widget.products.id ?? 0);
    //           }),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
