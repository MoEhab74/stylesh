import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

/// A reusable horizontal size/option selector with chip-style items.
///
/// Selected: filled background + white text.
/// Unselected: transparent background + outlined border.
class SizeSelector extends StatefulWidget {
  final List<String> items;
  final ValueChanged<int>? onSelected;
  final int initialIndex;
  final Color? selectedColor;
  final Color? unselectedBorderColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final double? itemHeight;
  final double? itemMinWidth;
  final double? spacing;

  const SizeSelector({
    super.key,
    required this.items,
    this.onSelected,
    this.initialIndex = 0,
    this.selectedColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.itemHeight,
    this.itemMinWidth,
    this.spacing,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveSelectedColor =
        widget.selectedColor ?? AppColors.primaryColor;
    final effectiveBorderColor =
        widget.unselectedBorderColor ?? AppColors.borderColor;
    final effectiveHeight = widget.itemHeight ?? 36.h;
    final effectiveMinWidth = widget.itemMinWidth ?? 50.w;
    final effectiveSpacing = widget.spacing ?? 10.w;
    final effectiveSelectedStyle = widget.selectedTextStyle ??
        AppTextStyles.montserratSemiBold14w600.copyWith(
          color: AppColors.whiteColor,
          fontSize: 14.sp,
        );
    final effectiveUnselectedStyle = widget.unselectedTextStyle ??
        AppTextStyles.montserratRegular14w400.copyWith(
          color: AppColors.blackColor,
          fontSize: 14.sp,
        );

    return SizedBox(
      height: effectiveHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        separatorBuilder: (_, _) => SizedBox(width: effectiveSpacing),
        itemBuilder: (context, index) {
          final isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() => _selectedIndex = index);
              widget.onSelected?.call(index);
            },
            child: Container(
              constraints: BoxConstraints(minWidth: effectiveMinWidth),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: isSelected ? effectiveSelectedColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color:
                      isSelected ? effectiveSelectedColor : effectiveBorderColor,
                  width: 1.5,
                ),
              ),
              child: Text(
                widget.items[index],
                style: isSelected
                    ? effectiveSelectedStyle
                    : effectiveUnselectedStyle,
              ),
            ),
          );
        },
      ),
    );
  }
}
