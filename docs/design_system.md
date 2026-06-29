# Design System

## General Principles

The UI should be:

- Clean
- Modern
- Minimal
- Consistent
- Responsive

Always follow the existing design language.

## Colors

Always use AppColors.

Never hardcode colors.

Never use Colors.black, Colors.white, Colors.grey, etc.

If a new color is needed, add it to AppColors first.

## Typography

Always use TextStyles.

Never create TextStyle directly.

Never hardcode font sizes.

## Responsive Design

Always use flutter_screenutil.

Examples:

16.w

24.h

18.sp

12.r

Never use raw pixel values.

## Border Radius

Always use ScreenUtil.

Example:

16.r

24.r

Never hardcode radius values.

## Spacing

Maintain consistent spacing.

Prefer CustomSizedBox.

Avoid random spacing values.

## Icons

Use SVG whenever possible.

Use flutter_svg.

Keep icon sizes consistent.

## Images

Use CachedNetworkImage for network images.

Use assets for local images.

Never use Image.network directly.

## Buttons

Buttons should:

- Follow the existing button style.
- Reuse existing button widgets.
- Keep consistent height.
- Keep consistent border radius.

## Text Fields

Reuse existing text field widgets.

Do not create new implementations unless necessary.

## Cards

Reuse existing card widgets.

Maintain consistent shadows, radius and padding.

## Layout

Keep widget trees clean.

Extract repeated sections.

Prefer composition over nesting.

## Animations

Keep animations subtle.

Reuse existing animations if available.

Avoid unnecessary animations.

## UI Consistency

Before creating any UI:

Search for an existing implementation.

Match the design language of the application.

Avoid introducing a different visual style.