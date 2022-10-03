import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/models/products.dart';

import '../../provider/products_provider.dart';
import '../variation_dialog.dart';

class FormProduct extends StatefulWidget {
  FormProduct(
      {Key? key, this.products, required this.isEdit, required this.list})
      : super(key: key);
  Products? products;
  bool isEdit;
  List list;
  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
  File? image2;
  // File? image2;

Future pickImage()async{
  try{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
   if(image == null) return;
   final imageTemporary = File(image.path);
   setState(() {
     this.image2 = imageTemporary;
   }); }on PlatformException catch(e){
    print('Failed to pick the image');
   }
}


  TextEditingController nameEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController stockEditingController = TextEditingController();
  TextEditingController barcodeEditingController = TextEditingController();
  TextEditingController imageEditingController = TextEditingController();
  @override
  void initState() {
    nameEditingController.text = widget.products?.name ?? "";
    priceEditingController.text = widget.products?.price.toString() ?? "";
    stockEditingController.text = widget.products?.stock.toString() ?? "";
    barcodeEditingController.text = widget.products?.barcode ?? "";
    //imageEditingController.text = widget.products?.image ?? "" ;
    super.initState();
  }

  bool myswitch = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Edit Product" : "Add Product"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('     Product Name'),
          const SizedBox(
            height: 20,
          ),
          Card(
              margin: EdgeInsets.all(20),
              child: Container(
                  width: double.infinity,
                  child: TextField(
                    controller: nameEditingController,
                  ))),
                  const Text('     Product Image '),
          const SizedBox(
            height: 20,
          ),

           Card(
              margin: EdgeInsets.all(20),
              child: Container(
                  width: double.infinity,
                  child: TextField(
                    controller: imageEditingController,
                  ))),

          //  image2 !=null ? Center(child: Container(height: 200,width: 200,child: Image.file(image2!)),): const FlutterLogo(),
          // Container(
          //     width: double.infinity,
          //     child: Center(child: ElevatedButton(child: const Text('select image'),onPressed: () {
          //       pickImage();
          //     },),)
          //     ),
          
          
          const SizedBox(
            height: 20,),
          const Text('     Product Price'),
          const SizedBox(
            height: 20,
          ),
          Card(
              margin: EdgeInsets.all(20),
              child: Container(
                  width: double.infinity,
                  child: TextField(
                    controller: priceEditingController,
                  ))),
          const Text('     Product Barcode'),
          const SizedBox(
            height: 20,
          ),
          Card(
              margin: EdgeInsets.all(20),
              child: Container(
                  width: double.infinity,
                  child: TextField(
                    controller: barcodeEditingController,
                  ))),
                  
          const Text('     Product Stock'),
          const SizedBox(
            height: 20,
          ),
          Card(
              margin: EdgeInsets.all(20),
              child: Container(
                  width: double.infinity,
                  child: TextField(
                    controller: stockEditingController,
                  ))),
          const SizedBox(
            height: 20,
            
          ),
          
          if (!widget.isEdit)
            Switch(
                value: myswitch,
                onChanged: (s) {
                  myswitch = s;
                  setState(() {});
                  showDialog(
                      context: context,
                      builder: (context) => VariationDialog());
                }),
          SizedBox(
            height: 30,
          ),
          Consumer<ProductsProvider>(
            builder: (context, value, child) {
              return Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                      itemCount: value.list.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          width: double.infinity,
                          height: 150,
                          child: Column(
                            children: [
                              Text(value.list[index].name!),
                              
                              Text(value.list[index].price.toString()),
                              Text(value.list[index].barcode!),
                              Text(value.list[index].stock.toString()),
                            ],
                          ),
                        );
                      })));
            },
          ),
          Center(
            child: ElevatedButton(
              child: Text(widget.isEdit ? 'Update' : 'Add'),
              onPressed: () {
                widget.isEdit
                    ? provider.editData(context,
                        barcode: barcodeEditingController.text,
                        name: nameEditingController.text,
                        price: priceEditingController.text,
                        stock: stockEditingController.text,
                        id: widget.products!.id ?? 0)
                    : provider.addData(
                        context,
                        barcode: barcodeEditingController.text,
                        name: nameEditingController.text,
                        price: priceEditingController.text,
                        stock: stockEditingController.text,
                        has_attribute: myswitch,
                        variations: widget.list,
                        image : imageEditingController.text,
                      );
                     // provider.updateProduct(context, products: Products());
                     
                    
              }
            ),
          ),
        ],
      ),
    );
  }
}
