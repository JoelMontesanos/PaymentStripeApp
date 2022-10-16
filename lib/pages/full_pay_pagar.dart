import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/bloc/pagar_bloc.dart';
import 'package:stripe_app/models/tarjeta_credito.dart';

import '../widgets/total_pay_button.dart';

class FullPayScreen extends StatelessWidget {

  final  TarjetaCredito? tarjeta = PagarBloc().state.tarjeta;// here is the details

  @override
  Widget build(BuildContext context) {
      print(tarjeta?.cvv);////// we're getting a null value here tha's what's needs to be fixed
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            context.read<PagarBloc>().add(OnDesactivarTarjeta());
            Navigator.pop(context);
          },
          ),
        title: Center(child: Text('')),
      ),
      body: Stack(        
        children: [
          Container(),
          /*Hero(
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
          ),*/

          Positioned(
              bottom: 0,
              child: TotalPayButton()
            )

        ],
      ),
    );
  }
}