import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:izzatillo/screen/auth/singIn/auth_screen.dart';
import '../bloc/basket/basket_bloc.dart';
import '../bloc/basket/basket_event.dart';
import '../bloc/product_bloc/product_bloc.dart';
import '../bloc/product_bloc/product_event.dart';
import '../data/repository/basket_repositroy.dart';
import '../data/repository/product_repositroy.dart';
import '../screen/main_screen/home_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ProductRepository()),
        RepositoryProvider(create: (_) => BasketRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            ProductBloc(productRepository: context.read<ProductRepository>())..add(GetProductEvent(productName: 'All Product', category: "All Categories",search: ''))),

        BlocProvider(create: (context)=>
        BasketBloc(basketRepository: context.read<BasketRepository>())..add(GetBasketEvent())
        ),
        ],
        child: ScreenUtilInit(
          designSize:const Size(360,800),
          builder: (context,child){
            return  MaterialApp(
              home: child,
              debugShowCheckedModeBanner: false,
            );
          },
          child: const AuthScreen(),
        ),
      ),
    );
  }
}
