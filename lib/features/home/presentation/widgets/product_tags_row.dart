import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/features/home/presentation/widgets/tag_chip_widget.dart';

class ProductTagsRow extends StatelessWidget {
  const ProductTagsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TagChip(icon: Icons.location_on_outlined, label: 'Nearest Store'),
          SizedBox(width: 8.w),
          TagChip(icon: Icons.workspace_premium_outlined, label: 'VIP'),
          SizedBox(width: 8.w),
          TagChip(icon: Icons.autorenew_outlined, label: 'Return policy'),
        ],
      ),
    );
  }
}

