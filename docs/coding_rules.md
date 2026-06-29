# Coding Rules

## General Philosophy

The project prioritizes:

- Readability over clever code.
- Reusability over duplication.
- Consistency over personal preference.
- Simplicity over unnecessary abstraction.

## Widgets

- Keep widgets small and focused.
- Extract reusable widgets whenever possible.
- Avoid large build methods.
- Prefer StatelessWidget unless state is required.
- Feature-specific widgets belong inside the feature's widgets folder.
- Shared widgets belong in core/widgets.

## Styling

Never use TextStyle directly.

Always use TextStyles.

Never use Colors directly.

Always use AppColors.

Do not hardcode colors.

Do not hardcode font sizes.

## Responsive Design

All dimensions must use flutter_screenutil.

Examples:

16.w

24.h

18.sp

12.r

Never hardcode pixel values.

## Spacing

Prefer CustomSizedBox over SizedBox.

Maintain consistent spacing throughout the project.

## Images

Use CachedNetworkImage for network images.

Use flutter_svg for SVG assets.

Avoid Image.network directly.

## State Management

Use flutter_bloc.

Business logic belongs inside Cubits.

Views react to states only.

Never fetch data inside widgets.

Never perform API calls inside Views.

## Repositories

Repositories are the only layer responsible for data retrieval.

Views never communicate with repositories directly.

Cubits interact with repositories.

## Naming

Widgets end with Widget when appropriate.

Cubits end with Cubit.

States end with State.

Repository interfaces end with Repo.

Repository implementations end with RepoImp.

Model classes end with Model.

## Constructors

Use const constructors whenever possible.

Mark widgets as const whenever possible.

## Code Style

Avoid unnecessary comments.

Write self-explanatory code.

Avoid deeply nested widgets.

Extract private helper widgets if needed.

## Imports

Remove unused imports.

Group imports consistently.

Avoid duplicate imports.

## Performance

Avoid rebuilding unnecessary widgets.

Use const widgets whenever possible.

Extract static UI into separate widgets.

## Reusable Components

Before creating a new widget:

Search the project.

If a similar widget exists, reuse it.

Do not duplicate components.

If multiple screens need the same widget, move it into core/widgets.

## AI Instructions

Before writing code:

Search the project for an existing implementation.

Prefer extending existing code over rewriting it.

Follow the existing coding style.

Do not introduce new patterns unless explicitly requested.

Never rename files unless necessary.

Never change unrelated files.

## Before Finishing

Always verify:

No duplicated widgets.

No unused imports.

No dead code.

No hardcoded values.

Consistent naming.

Responsive layout.

Uses existing reusable widgets.

Code compiles without errors.

## UI Generation Rules

When implementing UI:

- Match the Figma design as closely as possible.
- Prefer pixel-perfect implementation.
- Reuse existing widgets before creating new ones.
- If a reusable widget is missing, create it.
- Keep the widget tree clean and readable.
- Separate large sections into their own widgets.

## Think Before Coding

Before writing any code:

1. Analyze the task.
2. Search the codebase.
3. Identify reusable components.
4. Identify existing patterns.
5. Create a short implementation plan.
6. Only then start writing code.