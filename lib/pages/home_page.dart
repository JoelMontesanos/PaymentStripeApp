import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/bloc/bloc/pagar_bloc.dart';
import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/full_pay_pagar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/total_pay_button.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('')),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.add),
              ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: .9
                ),
                physics: BouncingScrollPhysics(),
                itemCount: tarjetas.length,
                itemBuilder: (_,i){
                  final tarjeta = tarjetas[i];
                  return GestureDetector(
                    onTap: (){
                      context.read<PagarBloc>().add(OnSeleccionarTarjeta(tarjeta));
                      Navigator.push(context, navegarFadeIn(context, FullPayScreen()));                      
                    },
                    child: 
                    Hero(
                      tag: tarjeta.cardNumber,
                      child: 
                      CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden, 
                        expiryDate: tarjeta.expiracyDate, 
                        cardHolderName: tarjeta.cardHolderName, 
                        cvvCode: tarjeta.cvv, 
                        showBackView: false,                   
                        onCreditCardWidgetChange:(CreditCardBrand empty){} ,
                        ),
                    ),
                  );
                }
              ),
            ),

            Positioned(
              bottom: 0,
              child: TotalPayButton()
            )



          ],
        )
      )
    );
  }
}