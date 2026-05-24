import 'package:stylesh/core/cache/cache_helper.dart';
import 'package:stylesh/core/utils/app_strings.dart';

class OnboardingService {
  // Cachehelper instance
  final CacheHelper _cacheHelper;
  OnboardingService(this._cacheHelper);

  static const String _firstVisitKey = AppStrings.isFirstVisitKey;

  /// Checks if this is the user's first time opening the app.
  Future<bool> isFirstVisit() async {
    final String? value = await _cacheHelper.getData(key: _firstVisitKey);
    // If we haven't saved anything for this key yet, it's their first visit
    return value == null;
  }

  /// Marks the onboarding as completed so it won't show again.
  Future<void> completeOnboarding() async {
    // Save a string value to indicate they are no longer a first-time visitor
    await _cacheHelper.saveData(key: _firstVisitKey, value: 'false');
  }
}
