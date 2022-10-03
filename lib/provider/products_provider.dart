
import 'package:flutter/material.dart';
import 'package:storeapp/Constant/dio.dart';
import 'package:storeapp/models/products.dart';
import '../Constant/contant.dart';


class ProductsProvider extends ChangeNotifier {
  ProductsModel productsmodel = ProductsModel();
  getData(context) async {
    final response = await DioHelper.getData(context,
        url: "api",
        loading: true,
        token: Constant.token);
    if (response != null) {
      productsmodel = ProductsModel.fromJson(response.data);
      notifyListeners();
    } else {
      print("failed");
    }
  }

 

 

  
  
}
