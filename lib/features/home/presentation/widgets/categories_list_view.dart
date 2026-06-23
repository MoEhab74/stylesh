import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/features/home/data/models/category_model.dart';
import 'package:stylesh/features/home/presentation/cubit/categories_cubit/categories_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/categories_cubit/categories_state.dart';
import 'package:stylesh/features/home/presentation/widgets/categories_list_view_item_builder.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading || state is CategoriesInitial) {
          return SizedBox(
            height: 87.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is CategoriesError) {
          return SizedBox(
            height: 87.h,
            child: Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          );
        }
        if (state is CategoriesLoaded) {
          final List<CategoryModel> categories = state.categories;
          return SizedBox(
            height: 87.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CategoriesListViewItemBuilder(
                    categoryModel: categories[index],
                  ),
              separatorBuilder: (context, index) =>
                  const CustomSizedBox(width: 8),
              itemCount: categories.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
