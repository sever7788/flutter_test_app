import '../../domain/purchase_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'purchases_map_event.dart';
part 'purchases_map_state.dart';

//Hydrated Bloc is used to interact with SharedPreferences
// and store the shopping cart locally
class PurchasesMapBloc
    extends HydratedBloc<PurchasesMapEvent, PurchasesMapState> {
  PurchasesMapBloc() : super(PurchasesMapState(purchasesMap: {})) {
    //processing clicks on the 'Add to cart' button
    on<AddPurchase>((event, emit) {
      final int id = event.purchase.id;

      state.purchasesMap[id] = event.purchase;
      emit(PurchasesMapState(purchasesMap: state.purchasesMap));
    });
    //processing the incrementation of the product counter by 1
    on<IncrementPurchaseCounter>((event, emit) {
      final int id = event.id;

      state.purchasesMap[id]?.count++;
      emit(PurchasesMapState(purchasesMap: state.purchasesMap));
    });
    //processing the decrementation of the product counter by 1
    on<DecrementPurchaseCounter>((event, emit) {
      final int id = event.id;

      int? counter = state.purchasesMap[id]?.count;
      if (counter != null && counter > 0) {
        state.purchasesMap[id]!.count = --counter;
        if (counter == 0) state.purchasesMap.remove(id);
      }
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
