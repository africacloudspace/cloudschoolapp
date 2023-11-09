// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;
import 'package:teacher_cloudschool/ui/auth/forgot_password/forgot_password_view.dart'
    as _i5;
import 'package:teacher_cloudschool/ui/auth/login_password/login_password_view.dart'
    as _i4;
import 'package:teacher_cloudschool/ui/auth/login_username/login_username_view.dart'
    as _i3;
import 'package:teacher_cloudschool/ui/dashboard/academics/cbc_curriculum/cbc_curriculum_view.dart'
    as _i7;
import 'package:teacher_cloudschool/ui/dashboard/dashboard_view.dart' as _i6;
import 'package:teacher_cloudschool/ui/dashboard/profile/change_password/change_password_view.dart'
    as _i9;
import 'package:teacher_cloudschool/ui/dashboard/profile/edit_profile/edit_profile_view.dart'
    as _i10;
import 'package:teacher_cloudschool/ui/dashboard/profile/preferences/preferences_view.dart'
    as _i8;
import 'package:teacher_cloudschool/ui/splash_screen/splash_screen_view.dart'
    as _i2;

class Routes {
  static const splashScreenView = '/';

  static const loginUserNameView = '/login-user-name-view';

  static const loginPasswordView = '/login-password-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const dashboardView = '/dashboard-view';

  static const cBCCurriculumView = '/c-bc-curriculum-view';

  static const preferencesView = '/preferences-view';

  static const changePasswordView = '/change-password-view';

  static const editProfile = '/edit-profile';

  static const all = <String>{
    splashScreenView,
    loginUserNameView,
    loginPasswordView,
    forgotPasswordView,
    dashboardView,
    cBCCurriculumView,
    preferencesView,
    changePasswordView,
    editProfile,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginUserNameView,
      page: _i3.LoginUserNameView,
    ),
    _i1.RouteDef(
      Routes.loginPasswordView,
      page: _i4.LoginPasswordView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i5.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i6.DashboardView,
    ),
    _i1.RouteDef(
      Routes.cBCCurriculumView,
      page: _i7.CBCCurriculumView,
    ),
    _i1.RouteDef(
      Routes.preferencesView,
      page: _i8.PreferencesView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i9.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.editProfile,
      page: _i10.EditProfile,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginUserNameView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginUserNameView(),
        settings: data,
      );
    },
    _i4.LoginPasswordView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginPasswordView(),
        settings: data,
      );
    },
    _i5.ForgotPasswordView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ForgotPasswordView(),
        settings: data,
      );
    },
    _i6.DashboardView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.DashboardView(),
        settings: data,
      );
    },
    _i7.CBCCurriculumView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CBCCurriculumView(),
        settings: data,
      );
    },
    _i8.PreferencesView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.PreferencesView(),
        settings: data,
      );
    },
    _i9.ChangePasswordView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ChangePasswordView(),
        settings: data,
      );
    },
    _i10.EditProfile: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.EditProfile(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginUserNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginUserNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCBCCurriculumView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cBCCurriculumView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreferencesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.preferencesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfile([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfile,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginUserNameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginUserNameView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCBCCurriculumView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cBCCurriculumView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPreferencesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.preferencesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfile([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfile,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
