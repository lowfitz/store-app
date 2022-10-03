import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: Text('                Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 120,
                            width: 120,
                            child: Card(
                              child: Image.network(
                                'https://th.bing.com/th/id/OIP.zh4XdVK6B6B_KqYSxZ67agHaGS?pid=ImgDet&rs=1',
                                fit: BoxFit.fill,),
                            )
                              ),
                        ),
                            SizedBox(width: 10,),
                           Column(children: [ Text('Product 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                           Text('USD 50.00',style: TextStyle(fontWeight: FontWeight.w300),),
                            Row(children: [
                            Chip(label: Icon(Icons.remove,color: Colors.white,size: 10,),backgroundColor: Colors.black,),
                            Text('0',style: TextStyle(fontWeight: FontWeight.bold),),
                            Chip(label: Icon(Icons.add,color: Colors.white,size: 10,),backgroundColor: Colors.black,),
                           ],)
                           ],)
                          
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 120,
                            width: 120,
                            child: Card(
                              child: Image.network(
                                'https://i.pinimg.com/originals/e5/0a/55/e50a554fbdf3ae2e85de5103acb4b703.png',
                                fit: BoxFit.fill,),
                            )
                              ),
                        ),
                            SizedBox(width: 10,),
                           Column(children: [ Text('Product 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                           Text('USD 120.00',style: TextStyle(fontWeight: FontWeight.w300),),
                           Row(children: [
                            Chip(label: Icon(Icons.remove,color: Colors.white,size: 10,),backgroundColor: Colors.black,),
                            Text('0',style: TextStyle(fontWeight: FontWeight.bold),),
                            Chip(label: Icon(Icons.add,color: Colors.white,size: 10,),backgroundColor: Colors.black,),
                           ],)
                           ],)
                          
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 190,),
              Divider(),
              Row(

                children: [
                  Column(
                    children: [
                      Text('Total'),
                      Text('  USD 170.00',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  SizedBox(width: 55,),
                   Container(height: 40,width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),child: ElevatedButton(child: Text('CHECKOUT'),onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black )),)),
                ],
                
              ),
              Divider()
         ] ),
        ],
      ),

    );
  }
}