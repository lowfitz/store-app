import 'package:flutter/material.dart';
import 'package:storeapp/Screens/widgets/form_product.dart';


class AddProduct extends StatefulWidget {
  AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  @override
  Widget build(BuildContext context) {
    return FormProduct(
      list: [],
      isEdit: false,
    );
  }
}
