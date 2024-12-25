part of 'purchases_map_bloc.dart';

class PurchasesMapState {
  PurchasesMapState({required this.purchasesMap});

  final Map<int, PurchaseModel> purchasesMap;

  int getCounter(int id) {
    final PurchaseModel? purchase = purchasesMap[id];
    return purchase != null ? purchase.count : 0;
  }
}
