import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../models/tarjeta_credito.dart';
import '../widgets/total_pay_button.dart';

class FullPayScreen extends StatelessWidget {

  final tarjeta = TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Fernando Herrera'
    );

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('')),
      ),
      body: Stack(        
        children: [
          Container(),
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


          Positioned(
              bottom: 0,
              child: TotalPayButton()
            )


        ],
      ),
    );
  }
}