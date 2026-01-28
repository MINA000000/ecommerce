import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_states.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen();

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final String categoryId =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
      body: BlocProvider<ProductsCubit>(
        create: (context) =>
            getIt.get<ProductsCubit>()..getProducts(categoryId: categoryId),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is GetProductsLoading) {
              return LoadingIndicator();
            } else if (state is GetProductsError) {
              return ErrorIndicator(state.message);
            } else if (state is GetProductsSuccess) {
              return BlocListener<CartCubit, CartState>(
                listener: (_, state) {
                  if (state is AddProductLoading) {
                    UIUtils.showLoading(context);
                  } else if (state is AddProductError) {
                    UIUtils.hideLoading(context);
                    UIUtils.showMessage(state.message);
                  } else if (state is AddProductSuccess) {
                    UIUtils.hideLoading(context);
                    UIUtils.showMessage('Product added correctly');
                  }
                },
                child: BlocListener<WishlistCubit, WishlistState>(
                  listener: (context, state) {
                    if (state is AddProductToWishlistLoading) {
                      UIUtils.showLoading(context);
                    } else if (state is AddProductToWishlistError) {
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.message);
                    } else if (state is AddProductToWishlistSuccess) {
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage('product added successfully');
                    }
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                    itemBuilder: (_, index) =>
                        ProductItem(state.products[index]),
                    itemCount: state.products.length,
                    padding: EdgeInsets.all(Insets.s16.sp),
                  ),
                ),
              );
            } else {
              return Center(child: Text('No products'));
            }
          },
        ),
      ),
    );
  }
}
