import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeapp/Constant/contant.dart';
import 'package:storeapp/home%20page/homepage2.dart';

import '../../Constant/dio.dart';

class LogInScreen extends StatefulWidget {
   const LogInScreen({super.key});




  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailcontroller = TextEditingController();
TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
     //Color(0xFF00D3DE),
      body: ListView(
        children: [
         
           Column(
            children: [
              
              Container(
                height: 350,
                width: double.infinity,
                decoration:const BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/lowfitz.png',),
                  fit: BoxFit.cover,
                  )
                ),
                child: Stack(children: const [
                  Positioned(
                    left: 150,
                    bottom: 5,
                    child: Text('LogIn',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                    )
                ],)
              ),
              
             
              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                       
                      keyboardType: TextInputType.emailAddress,
                      
                      decoration:  InputDecoration(
                       // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 230, 177, 20) )),
                        hintText: ' E-Mail',
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          )),
                      controller: emailcontroller,
                      ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                       
                      obscureText: true,
                      decoration:  InputDecoration(
                        hintText: ' PassWord',
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                          )),
                      controller: passcontroller,
                      ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    width: 130,
                    child: ElevatedButton(
                     style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 230, 177, 20)  ),
                      ),
                      child: Text('Log In',style: TextStyle(color: Colors.black),),
                  
                  
                      onPressed: ()async{
                  
                  
                     final response = await DioHelper.postData(context,
                          url: "api/login",
                          loading: true,
                          body: {"email": emailcontroller.text,"password":passcontroller.text}
                          );
                  
                  print(response?.data['token']);
                  
                    if (response != null) {
                      Shared.saveToken("token",response.data['token']);
                      Constant.token = Shared.loaddata("token");
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Logged In")));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2(),));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Wrong Email or Password Please Try Again")));
                      }
                      
                      },),
                  ),
                ),)
            ],
          ),
          ])
        
      );
    
  }
}
class Shared {
  static late SharedPreferences myShared ;
 static init()async
  {
    myShared =await SharedPreferences.getInstance();
  }
static saveToken (key,value)async{
await myShared.setString(key, value);
}static loaddata(key){
return  myShared.get(key);
}
static removedata(key)async{
  return await myShared.remove(key);
}

}
