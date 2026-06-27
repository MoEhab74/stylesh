import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';
import 'package:stylesh/features/home/presentation/widgets/product_card_widget.dart';

class ProductHorizontalListSection extends StatefulWidget {
  const ProductHorizontalListSection({super.key});

  @override
  State<ProductHorizontalListSection> createState() =>
      _ProductHorizontalListSectionState();
}

class _ProductHorizontalListSectionState
    extends State<ProductHorizontalListSection> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // لو المستخدم وصل لـ 90% من اللست → اطلب المزيد
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (currentScroll >= maxScroll * 0.9) {
      context.read<ProductsCubit>().getMoreProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsError || state is ProductsPaginationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state is ProductsError
                    ? state.message
                    : state is ProductsPaginationError
                    ? state.message
                    : "Try agin Later",
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }
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
        List<ProductModel> products = [];
        bool hasMore = false;
        bool isPaginationLoading = false;

        if (state is ProductsLoaded) {
          products = state.products;
          hasMore = state.hasMore!;
        } else if (state is ProductsPaginationLoading) {
          products = state.products;
          isPaginationLoading = true;
        } else if (state is ProductsPaginationError) {
          products = state.products;
        }

        if (products.isEmpty) return const SizedBox.shrink();

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
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(12.w),
                itemCount: products.length + (isPaginationLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == products.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.productDetails, extra: {'productId': products[index].id});
                    },
                    child: ProductCard(product: products[index]),
                  );
                },
              ),
              Positioned(
                right: 8.w,
                top: 100.w,
                child: _ArrowButton(scrollController: _scrollController),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.scrollController});
  final ScrollController scrollController;
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
        onPressed: () {
          scrollController.animateTo(
            scrollController.offset + 200,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
        color: AppColors.primaryColor,
      ),
    );
  }
}
