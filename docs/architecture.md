## Overall Architecture

The project follows MVVM Architecture.

Every feature is isolated.

Each feature owns its own:

- data
- presentation

Features should not directly depend on each other.

Shared code belongs in the core module.

## Feature Structure

Each feature follows this structure:

feature_name/

data/

models/

repos/

presentation/

cubits/

views/

widgets/

## Layers

Data Layer Contains:

Models

Abstract Repository

Repository Implementation

No UI code.

No Widgets.


Presentation Layer Contains:

Cubits

Views

Widgets

## State Management

Use flutter_bloc.

Business logic belongs inside Cubits.

UI Widgets should never perform data fetching.

Views only react to Cubit states.

UI should remain as dumb as possible.

## Dependency Injection

Use GetIt.

Every Repository must be registered.

Every Cubit must receive dependencies through constructor injection.

## Routing

Use GoRouter.

Routes are centralized.

Never use Navigator directly unless required.

## Feature Creation Checklist

Before creating a feature:

Create folder structure.

Create models.

Create repositories.

Register dependencies.

Create Cubit.

Create States.

Create Views.

Extract reusable widgets.

## Architecture Rules

Cubits are grouped by responsibility.

Each Cubit should manage only one feature or one business concern.

If a widget exceeds reasonable complexity or is reused, extract it into the widgets folder.

Shared code belongs in core/.

Feature-specific code must never be placed in core.