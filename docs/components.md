# Components

## General Rules

Before creating any widget:

Search the codebase.

If a reusable widget already exists:

Reuse it.

Never duplicate components.

## Shared Components

Shared widgets belong in:

core/widgets/

Never duplicate a shared widget inside a feature.

## Feature Components

Feature-specific widgets belong inside:

feature/presentation/widgets/

Do not move them to core unless they become reusable across features.

## Reusability Rules

Extract a widget when:

- It is reused.
- It exceeds reasonable complexity.
- It represents a standalone UI section.

## Naming

Use descriptive names.

Examples:

ProductCard

CategoryItem

CustomButton

PriceSection

RatingWidget

## Responsibilities

Each widget should have one responsibility.

Avoid widgets that perform multiple unrelated tasks.

## Stateless First

Prefer StatelessWidget.

Only use StatefulWidget when local state is required.

## Composition

Prefer combining small widgets over creating one large widget.

## Existing Components

Before implementing a screen:

Search for:

- Buttons
- Text Fields
- Cards
- Chips
- App Bars
- Bottom Sheets
- Dialogs
- Loading Indicators

Reuse them whenever possible.

## Creating New Components

If no reusable widget exists:

Create one.

Place it in the correct folder.

Use it immediately.
