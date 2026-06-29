import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

/// A reusable expandable text widget that shows a truncated version
/// with a "More" / "Less" toggle link.
class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? textStyle;
  final String moreText;
  final String lessText;
  final Color? linkColor;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 3,
    this.textStyle,
    this.moreText = 'More',
    this.lessText = 'Less',
    this.linkColor,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = widget.textStyle ??
        AppTextStyles.montserratRegular12w400.copyWith(
          color: AppColors.textSecondary,
          fontSize: 12.sp,
          height: 1.6,
        );
    final effectiveLinkColor = widget.linkColor ?? AppColors.primaryColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Build a TextSpan to measure how many lines the full text takes
        final textSpan = TextSpan(text: widget.text, style: effectiveStyle);
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;

        if (!isOverflowing) {
          // Text fits within trimLines — no toggle needed
          return Text(widget.text, style: effectiveStyle);
        }

        return RichText(
          maxLines: _isExpanded ? null : widget.trimLines,
          overflow:
              _isExpanded ? TextOverflow.clip : TextOverflow.ellipsis,
          text: TextSpan(
            text: widget.text,
            style: effectiveStyle,
            children: [
              const TextSpan(text: '  '),
              TextSpan(
                text: _isExpanded ? widget.lessText : widget.moreText,
                style: effectiveStyle.copyWith(
                  color: effectiveLinkColor,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() => _isExpanded = !_isExpanded);
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
