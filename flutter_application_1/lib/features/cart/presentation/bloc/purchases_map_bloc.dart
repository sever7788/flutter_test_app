import 'package:flutter_test_app/features/cart/domain/purchase_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'purchases_map_event.dart';
part 'purchases_map_state.dart';

class PurchasesMapBloc
    extends HydratedBloc<PurchasesMapEvent, PurchasesMapState> {
  PurchasesMapBloc() : super(PurchasesMapState(purchasesMap: {})) {
    on<AddPurchase>((event, emit) {
      final int id = event.purchase.id;

      state.purchasesMap[id] = event.purchase;

      emit(PurchasesMapState(purchasesMap: state.purchasesMap));
    });
  }

  @override
  PurchasesMapState? fromJson(Map<String, dynamic> json) {
    try {
      final purchasesMap = (json['purchasesMap'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          int.parse(key),
          PurchaseModel(
            count: value['count'] as int,
            id: value['id'] as int,
            title: value['title'] as String,
            price: (value['price'] as num).toDouble(),
            description: value['description'] as String,
            images: List<String>.from(value['images'] as List),
            thumbnail: value['thumbnail'] as String,
          ),
        ),
      );

      return PurchasesMapState(purchasesMap: purchasesMap);
    } catch (e) {
      // Handle deserialization error
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PurchasesMapState state) {
    try {
      final purchasesMap = state.purchasesMap.map(
        (key, value) => MapEntry(
          key.toString(),
          {
            'count': value.count,
            'id': value.id,
            'title': value.title,
            'price': value.price,
            'description': value.description,
            'images': value.images,
            'thumbnail': value.thumbnail,
          },
        ),
      );

      return {'purchasesMap': purchasesMap};
    } catch (e) {
      // Handle serialization error
      return null;
    }
  }
}
