part of 'pagar_bloc.dart';

class PagarState {
  final double montoPagar;
  final String moneda; //MXN
  final bool tarjetaActiva;
  final TarjetaCredito? tarjeta;
 
  PagarState({
    this.montoPagar = 375.20, 
    this.moneda = 'MXN', 
    this.tarjetaActiva = false, 
    this.tarjeta
  });

  PagarState copyWith({
    double? montoPagar,
    String? moneda,
    bool? tarjetaActiva,
    TarjetaCredito? tarjeta,
  })=>PagarState(
    montoPagar: montoPagar ?? this.montoPagar,
    moneda: moneda ?? this.moneda,
    tarjetaActiva: tarjetaActiva ?? this.tarjetaActiva,
    tarjeta: tarjeta ?? this.tarjeta
  );
}
