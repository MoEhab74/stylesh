import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/home/data/models/category_model.dart';

class CategoriesListViewItemBuilder extends StatelessWidget {
  const CategoriesListViewItemBuilder({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.categoryProducts,
          extra: {
            'categoryId': categoryModel.id.toString(),
            'categoryName': categoryModel.name,
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipOval(
              child: Container(
                width: 56.w,
                height: 56.h,
                color: AppColors.borderColor.withValues(alpha: 0.1),
                child: Image.network(
                  categoryModel.image ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.borderColor.withValues(alpha: 0.2),
                    child: Icon(
                      Icons.category_outlined,
                      size: 24.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const CustomSizedBox(height: 4),
          Text(
            categoryModel.name,
            style: AppTextStyles.montserratRegular14w400.copyWith(
              fontSize: 12.sp,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

