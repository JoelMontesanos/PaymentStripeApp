import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/bloc/pagar_bloc.dart';
import 'package:stripe_app/pages/full_pay_pagar.dart';
import 'package:stripe_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_,) =>PagarBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StripeApp',
        routes: {
          'home':(context) => HomeScreen(),
          'full_pay_page':(context) => FullPayScreen(),
        },
        initialRoute: 'home' ,
        theme: ThemeData.light().copyWith(
          primaryColor: Color.fromRGBO(40, 72, 121, 1),
          scaffoldBackgroundColor: Color.fromRGBO(33, 35, 42, 1),
        ),
      ),
    );
  }
}


//Contraseña en facebook: DerekMontesano!
//Contraseña en Icloud: McBeth5!
//Contraseña en hotmail: McBeth5!