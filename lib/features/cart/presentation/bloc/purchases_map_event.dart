part of 'purchases_map_bloc.dart';

abstract class PurchasesMapEvent {}

class AddPurchase extends PurchasesMapEvent {
  final PurchaseModel purchase;

  AddPurchase({required this.purchase});
}

class ChangeCountPurchase extends PurchasesMapEvent {
  final int counter;
  final int id;

  ChangeCountPurchase({required this.counter, required this.id});
}

class IncrementPurchaseCounter extends PurchasesMapEvent {
  final int id;

  IncrementPurchaseCounter({required this.id});
}

class DecrementPurchaseCounter extends PurchasesMapEvent {
  final int id;
  
  DecrementPurchaseCounter({required this.id});
}
