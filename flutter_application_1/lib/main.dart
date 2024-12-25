import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/routes.dart';
import 'package:flutter_test_app/core/theme/theme.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';
import 'package:flutter_test_app/features/home/data/dummy_repository.dart';
import 'package:flutter_test_app/features/home/presentation/bloc/products_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  GetIt.I.registerLazySingleton(() => DummyRepository(dio: Dio()));

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _productsListBloc = ProductsListBloc(GetIt.I<DummyRepository>());
  final _purchasesMapBloc = PurchasesMapBloc();

  @override
  void initState() {
    _productsListBloc.add(LoadProductsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsListBloc>(
          create: (context) => _productsListBloc,
        ),
        BlocProvider<PurchasesMapBloc>(
          create: (context) => _purchasesMapBloc,
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
