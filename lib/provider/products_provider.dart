
import 'package:dio/dio.dart';
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
      print("failure");
    }
  }

  removeData(context, int id) async {
    final response = await DioHelper.deleteData(context,
        url: "api",
        loading: true,
        token: Constant.token);

    if (response != null) {
      getData(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Deleted")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("error")));
    }
  }

  editData(context,
      {required String name,
      required String price,
      required String stock,
      required String barcode,
      required int id}) async {
    final response = await DioHelper.putData(context,
        url: "api",
        loading: true,
        body: {
          "name": name,
          "price": price,
          "barcode": barcode,
          "stock": stock
        },
        token: Constant.token);
    if (response != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Edit Success")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error")));
    }
  }

   

  Future addData(
    context, {
    required String name,
    required String price,
    required String stock,
    required String barcode,
     required bool has_attribute,
     required List variations,
     required String? image,
  }) async {
    final response = await DioHelper.postData(context,
        url: "api/product",
        loading: true,
        body: {
          "name": name,
          "price": price,
          "barcode": barcode,
          "stock": stock,
          "cost": 12,
          "description": "a new Device ",
          "has_attribute": has_attribute,
          "variations": list,
          "image": image
          
        },
        token: Constant.token);
    if (response != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Upload Success")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    }
    Future updateProduct(context , {required Products products})async {
    final data = products.toJson();
    print(data);
    if(products.image != null){
      data["image"] = await MultipartFile.fromFile( products.image ?? "");  
    }
    final respone = await DioHelper.postData(context, url: 'api/product',loading: true, isForm: true,query: {"_methode": "Put"},body: data);
  }
  }

  List<Products> list = [];

  void addVarItem(Products item) {
    list.add(item);
    notifyListeners();
  }

  
  productDetails(context) async{
    final response = await DioHelper.getData(
      context, 
      url: "api/product?page=4",
      loading: true,
      token: Constant.token
      );
       if (response != null) {
      productsmodel = ProductsModel.fromJson(response.data);
      notifyListeners();
    } else {
      print("failure");
    }
  }



  
  
}
