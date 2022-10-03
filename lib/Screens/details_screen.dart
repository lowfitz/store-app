import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/models/products.dart';
import 'package:storeapp/provider/products_provider.dart';



class ProductDetailsScreen extends StatefulWidget {
    ProductDetailsScreen({Key? key,this.products, required this.variations}) : super(key: key,);
Products? products;
Variations? variations;
  @override
  State<ProductDetailsScreen> createState() => _HomePageState();
}

class _HomePageState extends State<ProductDetailsScreen> {
  List<Variations> myVartion= [];
  @override
  void initState() {
   
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<ProductsProvider>(context, listen: false);
      provider.getData(context);
      widget.products?.variations?.forEach((element) {
        print(element.toJson());
         myVartion.add(element);
      });
      print('myVartion');

      print(myVartion);
      
    });
    print("object");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          //title: Text(widget.products?.name?? ""),
        ),
        body: Consumer<ProductsProvider>(
          builder: (context, value, child,) => ListView.builder(
             
              itemBuilder: (BuildContext context, int i) {
    
                return Column(
                  children:[ ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    child: Container(
                      color: Colors.white,
                      height: 470,
                      width: double.infinity,
                      child: ListView(
                        
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            height: 300,
                            child: Image.network(widget.products?.image ?? "",
                             fit: BoxFit.contain,),
                             ),
                                    
                                    
                          Padding(
                            padding: EdgeInsets.only(left: 20,top:20,bottom: 5),
                            child: Text(widget.products?.name ?? "" ,
                            style: TextStyle(fontSize: 25),)
                            ), 
                                    
                                    
                          Padding(
                            padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                            child: Text("${widget.products?.stock.toString() ?? ""} In Stock" ,
                            )
                            ), 
                                    
                          Padding(
                            padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                            child: Text(widget.products?.description ?? "" ,
                            )
                            ),
                          
                         
                        ],
                      ),
                      ),
                  ),SizedBox(height: 10,),
                    Container(
                      
                      child: Padding(padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                '   Price : ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 192, 148, 17),
                                  fontSize: 12
                                  ),
                                  ),
                                  SizedBox(height: 2),
                              Text(
                                " \$${widget.products?.price.toString() ?? ""}",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
                                ),
                            ],
                          ),
                          SizedBox(width: 120,),
                          ElevatedButton(
                            style:  ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 230, 177, 20) )),
                            onPressed: (){},
                            child: Row(children: [ Icon(Icons.shopping_cart_outlined),Text('  Add to Cart')],),
                            )
                        ],
                      ),
                      ),
                    )
                 ] );
    
    },
                   itemCount: 1
    
    )));}}
