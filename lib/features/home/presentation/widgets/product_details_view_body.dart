import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/widgets/custom_app_bar.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';
import 'package:stylesh/features/home/presentation/widgets/product_page_view_builder.dart';
import 'package:stylesh/generated/assets.dart';

class ProductDetailViewBody extends StatefulWidget {
  const ProductDetailViewBody({
    super.key,
    required this.productId,
    this.onBackPressed,
  });

  final int productId;
  final VoidCallback? onBackPressed;

  @override
  State<ProductDetailViewBody> createState() => _ProductDetailViewBodyState();
}

class _ProductDetailViewBodyState extends State<ProductDetailViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ProductsCubit>().getProductById(
          productId: widget.productId,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add Scaffold
    return Scaffold(
      body:
          // This is a placeholder for the product details widget.
          SafeArea(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductDetailsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailsError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (state is ProductDetailsLoaded) {
                  return ProductDetailsWidget(
                    productId: state.product.id!,
                    imageList: state.product.images!,
                    onBackPressed: widget.onBackPressed,
                  );
                } else {
                  return Center(child: Text("No Products"));
                }
              },
            ),
          ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.productId,
    required this.imageList,
    this.onBackPressed,
  });
  final int productId;
  final List<String> imageList;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed!();
                    } else {
                      GoRouter.of(context).pop();
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                CustomAppBarIconWidget(
                  icon: SvgPicture.asset(Assets.assetsIconsShoppingCart),
                ),
              ],
            ),
          ),
          CustomSizedBox(height: 16.h),
          // PageView and DotIndicator section
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: ProductPageViewBuilder(imageList: imageList),
          ),

          // Size Text

          // Size ListView.separated

          // Title

          // SubTitle

          // Rate

          // Price Row

          //Description
        ],
      ),
    );
  }
}
