import 'package:flutter/material.dart';


import '../../Constant/contant.dart';
import '../../home page/homepage2.dart';
import '../Login/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      
      backgroundColor: Colors.black,
     child: Center(
       child: Column(
          children:  [
            Container(
                  height: 150,
                  width: double.infinity,
                  decoration:const BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/lowfitz.png',),
                    fit: BoxFit.contain,
                    )
                  ),
                  child: Stack(children: const [
                    Positioned(
                      left: 150,
                      bottom: 5,
                      child: Text('',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                      )
                  ],)
                ),
            SizedBox(height: 30,),
            InkWell(
              onTap: 
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2(),)),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        icon: const Icon(Icons.home_outlined,color: Colors.white,
                        ),
                        onPressed: (){
                          
                        },
                        ),),
                    Text('Home',style: TextStyle(color: Colors.white),),
                    
                  ],
                  
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    icon: const Icon(Icons.person_outline,color: Colors.white,
                    ),
                    onPressed: (){},
                    ),),
                Text('Account',style: TextStyle(color: Colors.white),),
                
              ],
              
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    icon: const Icon(Icons.shield_moon,color: Colors.white,
                    ),
                    onPressed: (){},
                    ),),
                Text('Night Mode',style: TextStyle(color: Colors.white),),
                
              ],
              
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    icon: const Icon(Icons.wallet_outlined,color: Colors.white,
                    ),
                    onPressed: (){
     
                    },
                    ),),
                Text('Wallet',style: TextStyle(color: Colors.white),),
                
              ],
              
            ),
            InkWell(
              onTap: (){
                Shared.removedata(Constant.token);
                  Constant.token = "";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: const Icon(Icons.logout_outlined,color: Color.fromARGB(255, 230, 177, 20),
                      ),
                      onPressed: (){
                         Shared.removedata(Constant.token);
                  Constant.token = "";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
                      },
                      ),),
                  Text('Logout',style: TextStyle(color: Color.fromARGB(255, 230, 177, 20),),
                  
              )],
                
              ),
            ),
            
            
          
          ],
        ),
     ),
    );
  }
}