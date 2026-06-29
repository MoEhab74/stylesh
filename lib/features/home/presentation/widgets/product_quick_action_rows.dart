import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/features/home/presentation/widgets/product_quick_action_item.dart';

class ProductQuickActionsRow extends StatelessWidget {
  const ProductQuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionItem(
            icon: Icons.visibility_outlined,
            label: 'View Similar',
            onTap: () {},
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: QuickActionItem(
            icon: Icons.compare_arrows_outlined,
            label: 'Add to Compare',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

