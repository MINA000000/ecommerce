import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab();

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  final WishlistCubit _wishlistCubit = getIt.get<WishlistCubit>();
  @override
  void initState() {
    super.initState();
    _wishlistCubit.getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.s14.w,
        vertical: Sizes.s10.h,
      ),
      child: BlocBuilder<WishlistCubit, WishlistState>(
        buildWhen: (previous, current) =>
            (current is GetWishlistLoading) ||
            (current is GetWishlistError) ||
            (current is GetWishlistSuccess),
        builder: (context, state) {
          if (state is GetWishlistLoading) {
            return LoadingIndicator();
          } else if (state is GetWishlistError) {
            return ErrorIndicator(state.message);
          } else if (state is GetWishlistSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.s12.h),
                child: WishlistItem(product: state.products[index]),
              ),
            );
          } else {
            return Center(child: Text('No products'));
          }
        },
      ),
    );
  }
}
