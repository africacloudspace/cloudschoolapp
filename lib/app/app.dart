import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/ui/auth/forgot_password/forgot_password_view.dart';
import 'package:teacher_cloudschool/ui/auth/login_password/login_password_view.dart';
import 'package:teacher_cloudschool/ui/auth/login_username/login_username_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/academics/cbc_curriculum/cbc_curriculum_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/dashboard_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/profile/change_password/change_password_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/profile/edit_profile/edit_profile_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/profile/preferences/preferences_view.dart';
import 'package:teacher_cloudschool/ui/splash_screen/splash_screen_view.dart';

import '../services/alert_service.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

@StackedApp(
  //dependencies
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: APIService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: AlertService),
  ],

  //routes
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginUserNameView),
    MaterialRoute(page: LoginPasswordView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: CBCCurriculumView),
    MaterialRoute(page: PreferencesView),
    MaterialRoute(page: ChangePasswordView),
    MaterialRoute(page: EditProfile),
  ],
)
class AppSetup {}
