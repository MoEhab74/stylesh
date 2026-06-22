import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';
import 'package:stylesh/features/home/presentation/widgets/product_card_widget.dart';

class ProductHorizontalListSection extends StatelessWidget {
  const ProductHorizontalListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsError) {}
      },
      builder: (context, state) {
        if (state is ProductsLoading || state is ProductsInitial) {
          return SizedBox(
            height: 285.w,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is ProductsError) {
          return SizedBox(
            height: 285.w,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        }
        if (state is ProductsLoaded) {
          final List<ProductModel> products = state.products;
          return Container(
            height: 285.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(12.w),
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ProductCard(product: products[index]),
                ),
                Positioned(right: 8.w, top: 100.w, child: _ArrowButton()),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_ios, size: 16),
        onPressed: () {},
        color: AppColors.primaryColor,
      ),
    );
  }
}
