import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';
import 'package:stylesh/features/home/presentation/widgets/product_card_widget.dart';

class CategoryProductsView extends StatelessWidget {
  final String categoryName;

  const CategoryProductsView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: AppTextStyles.montserratSemiBold14w600.copyWith(
            fontSize: 18.sp,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading || state is ProductsInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductsError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          if (state is ProductsLoaded) {
            final List<ProductModel> products = state.products;
            if (products.isEmpty) {
              return Center(
                child: Text(
                  'No products found in this category',
                  style: AppTextStyles.montserratRegular14w400.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.w,
                childAspectRatio: 0.58,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                product: products[index],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
