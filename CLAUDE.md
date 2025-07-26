# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Essential Development Commands

### Flutter Commands
- `flutter pub get` - Install dependencies after pubspec.yaml changes
- `flutter analyze` - Run static analysis (linter configured in analysis_options.yaml)
- `flutter build runner build` - Generate Drift database code (run after database schema changes)
- `flutter run` - Run the app in debug mode
- `flutter build apk` - Build Android APK
- `flutter test` - Run tests

### Testing
- Test files are located in `test/` directory
- Use `flutter test` to run all tests
- Single test: `flutter test test/widget_test.dart`

## Architecture Overview

### Application Structure
This is a Flutter point-of-sale (POS) application for restaurants/bars with the following key components:

**State Management**: BLoC pattern with flutter_bloc
- Main BLoCs: `SyncBloc`, `CartBloc`, `DetailsBloc`, `PaymentBloc`, `InactivityBloc`, `ImageBloc`
- All BLoCs are provided at app level in `main.dart`

**Navigation**: GoRouter for declarative routing
- Routes defined in `lib/config/router.dart`
- Includes inactivity detection wrapper for kiosk mode

**Database**: Recently migrated from Isar to Drift
- Local SQLite database using Drift ORM
- Database schema in `lib/database/database.dart`
- Generated code in `lib/database/database.g.dart`

### Key Data Flow
1. **Sync Process**: `SyncBloc` fetches data from API and stores locally via Drift repositories
2. **Product Selection**: Users browse categories/products, managed by `DetailsBloc` 
3. **Cart Management**: `CartBloc` handles cart operations with deep equality for customized items
4. **Order Processing**: Orders sent to backend API via `OrderService` and `OrderRepository`

### Database Architecture (Drift Migration)
The app recently transitioned from Isar to Drift:
- **Tables**: `Products`, `ProductCategories`, `ProductMaterials`, `ProductAccompaniments`
- **Relationships**: Many-to-many relations between products and materials/accompaniments
- **Repositories**: Separate API repositories and local Drift repositories
- **Generated Code**: Run `flutter packages pub run build_runner build` after schema changes

### API Integration
- **Base URL**: `http://192.168.20.10:9095/` (configured in main.dart)
- **HTTP Client**: Dio with 10-second timeouts
- **Services**: `ProductsService`, `ProductCategoriesService`, `OrderService`, `ImageService`
- **Error Handling**: Centralized Dio exception handling in services

### Business Logic Components

**Sync System**:
- Fetches products/categories from API and stores locally
- Handles offline/online transitions
- Triggered on app startup via `SyncAllEvent`

**Cart System**:
- Supports product customization (ingredients, accompaniments)
- Deep equality comparison for duplicate detection
- Extension methods for order processing

**Order System**:
- Creates orders from cart items
- Includes customer info, device tracking, payment types
- Comprehensive logging for debugging

**Image Handling**:
- `cached_network_image` for efficient image loading
- `MemoryImageCache` utility for image management
- Fallback to local assets when network images fail

### UI Structure
- **Screens**: Welcome → Home → Products → Cart → Payment
- **Components**: Reusable widgets in `presentation/widgets/`
- **Theme**: Custom FastFood theme in `lib/config/theme.dart`
- **Assets**: Product images, carousels, loading GIFs in `assets/`

## Development Guidelines

### Database Changes
1. Modify schema in `lib/database/database.dart`
2. Run `flutter packages pub run build_runner build` to regenerate code
3. Update repository methods if needed
4. Test sync functionality

### Adding New BLoCs
1. Create bloc files in `presentation/bloc/[feature_name]/`
2. Add to MultiBlocProvider in `main.dart`
3. Follow existing event/state patterns

### API Service Development
1. Follow existing service patterns (see `OrderService`)
2. Use comprehensive logging for debugging
3. Handle all DioException types
4. Create corresponding repository wrapper

### Testing Network Connectivity
- API calls may fail in development if backend server is unavailable
- Sync functionality degrades gracefully with error states
- Check `SyncBloc` states for connection issues

## Important Notes

- **Inactivity Detection**: Kiosk mode with auto-logout after 60 seconds
- **Asset Management**: Product images stored in `assets/products/` with fallback handling  
- **Code Generation**: Always run build_runner after database schema changes
- **Error Logging**: Extensive logging throughout the app for debugging production issues
- **State Persistence**: Cart state is not persisted across app restarts (by design)