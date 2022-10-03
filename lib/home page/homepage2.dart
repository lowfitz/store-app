import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:storeapp/models/products.dart';
import 'package:storeapp/provider/products_provider.dart';
import '../Screens/cartScreen/cart_screen.dart';
import '../Screens/details_screen.dart';
import '../Screens/drawer/drawer.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<ProductsProvider>(context, listen: false);
      provider.getData(context);
    });
   

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 244, 244),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.short_text_sharp,
              color: Colors.black,),
              onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppDrawer()) )  ,),
          elevation: 0,
           actions: [
            IconButton(
              onPressed:() =>  Navigator.push(
                context, MaterialPageRoute(builder: ( context)=> const CartScreen())
                ),
                icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,),iconSize: 30,
           )],
          backgroundColor: Color.fromARGB(255, 251, 244, 244),
          title: const Text('             LowFitz',style: TextStyle(color: Colors.black),),
        ),
       // drawer: const AppDrawer(),
        
        body: ListView(
          children:[ 
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 290,
                      child: TextField(
                        
                        decoration:  InputDecoration(
                         // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 230, 177, 20) )),
                          hintText: ' Search here',
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            
                            )),
                        
                        ),
                    ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.mic_none_outlined,
                    color: Colors.black,size: 35,
                    ))
          ]),
              ),
              ),
            Text('       Choose Brand',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                        child: Consumer<ProductsProvider>(
                          builder: (context, value, child) => 
                          ListView.builder(
                            itemCount: value.productsmodel.products?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index)=>
                            Card(
                              elevation: 0,
                              child: Column(
                                children:[ 
                                  InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return  ProductDetailsScreen(products: value.productsmodel
                                                              .products![index],variations: Variations(),);
                                                        }));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                        color: Colors.white,
                                        width: 150,
                                        height: 100,
                                        child: Image.network(value.productsmodel.products?[index].image ?? "",fit: BoxFit.contain,),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(child: Text(value.productsmodel.products?[index].name ?? ""),)
            ]  ),
                            )
                            
                            ),
                        ),
              ),
              
              ),

            Padding(padding: EdgeInsets.all(10),
            child: Row(children:[
              Text('Popular     ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),),
              Text('Discount     ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),),
              Text('Exclusive',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),),
            ] )),

            
            Container(
              width: double.infinity,
              height: 500,
              child: Consumer<ProductsProvider>(
              
              builder: (context, value, child) => GridView.builder(
                
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 190,
                
                  maxCrossAxisExtent: 250,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1/1
                  
                  
                    
                  ),
                  
                  itemCount: value.productsmodel.products?.length ?? 0,
                   itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      onTap: (() {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return  ProductDetailsScreen(products: value.productsmodel
                                                          .products![index],variations: Variations(),);
                          }));
                        }),
                      child: GridTile(
                        
                        footer: Padding(
                          padding: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                            child: GridTileBar(
                              backgroundColor: Colors.black87,
                              
                              title:  Text(value.productsmodel.products?[index].name ?? "",style: TextStyle(fontSize: 12),),
                                      //   trailing:  Row(
                                      //     children:[ IconButton(
                                      //       iconSize: 20,
                                      //     onPressed: () {
                                      //       value.removeData(
                                      //           context,
                                      //           value.productsmodel.products?[index]
                                      //                   .id ??
                                      //               0);
                                      //     },
                                      //     icon: const Icon(Icons.delete)),
                                      //     IconButton(
                                      //       iconSize: 20,
                                      //   onPressed: () {
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder: (context) => EditScreen(
                                      //                   products: value.productsmodel
                                      //                       .products![index],
                                      //                 ))).then(
                                      //                          (_) => value.getData(context));
                                      //  },
                                      //   icon:const Icon(Icons.edit)),
                                      //     ]
                                      //   ),
                                        ),
                          ),
                        ),
                                    child: Padding(
                                      padding: const EdgeInsets.all( 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          
                                                          width: 200,
                                                          color: Colors.white,
                                                    
                                                          child:Image.network(value.productsmodel.products?[index].image ?? "" ,fit: BoxFit.contain,),
                                                        ),
                                      ),
                                    ),
                      ),
                    );
                   }
                   )
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              // ListView.builder(
              //     itemCount: value.productsmodel.products?.length ?? 0,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         child: InkWell(
                        
                        // onTap: (() {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context){
                        //     return  ProductDetailsScreen(products: value.productsmodel
                        //                                   .products![index],variations: Variations(),);
                        //   }));
                        // }),
                        
              //           child: Container(height: 80, margin: EdgeInsets.all(10), width: double.infinity,
              //               child: ListTile(
              //                 leading: Icon(Icons.shop),
              //                 trailing: Row(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     IconButton(
              //                         onPressed: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) => EditScreen(
              //                                         products: value.productsmodel
              //                                             .products![index],
              //                                       ))).then(
              //                               (_) => value.getData(context));
              //                         },
              //                         icon: Icon(Icons.edit)),
              //                     IconButton(
              //                         onPressed: () {
              //                           value.removeData(
              //                               context,
              //                               value.productsmodel.products?[index]
              //                                       .id ??
              //                                   0);
              //                         },
              //                         icon: Icon(Icons.delete)),
              //                   ],
              //                 ),
              //                 title: Text(
              //                     value.productsmodel.products?[index].name ?? ""),
              //                 subtitle: Text(
              //                     " ${value.productsmodel.products?[index].price.toString() ?? ""} \$"),
              //               )),
              //         ),
              //       );
              //     }),
                      ),
            ),
      ]  ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0xFF00D3DE),
        //   child: Icon(
        //     Icons.add,
        //      color: Colors.white,
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => AddProduct()));
        //   },
        // )
        );
  }
}
