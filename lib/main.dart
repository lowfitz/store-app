import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Constant/contant.dart';
import 'package:storeapp/Constant/dio.dart';
import 'package:storeapp/home%20page/home_page.dart';
import 'package:storeapp/home%20page/homepage2.dart';
import 'package:storeapp/provider/products_provider.dart';

import 'Screens/Login/login_screen.dart';

 main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper().init();
 await Shared.init();
Constant.token = Shared.loaddata("token") ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Constant.token.isEmpty?  const LogInScreen(): const HomePage2(),
      ),
    );
  }
}
