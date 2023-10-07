// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:beacon_communicator/page/main/main_view.dart' as _i2;
import 'package:beacon_communicator/page/shared/permission/permission_status_view.dart'
    as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const mainView = '/';

  static const permissionStatusView = '/permission-status-view';

  static const all = <String>{
    mainView,
    permissionStatusView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.mainView,
      page: _i2.MainView,
    ),
    _i1.RouteDef(
      Routes.permissionStatusView,
      page: _i3.PermissionStatusView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.MainView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.MainView(),
        settings: data,
      );
    },
    _i3.PermissionStatusView: (data) {
      final args = data.getArgs<PermissionStatusViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.PermissionStatusView(
            key: args.key,
            isDark: args.isDark,
            fullAccessIsNeeded: args.fullAccessIsNeeded,
            status: args.status,
            permission: args.permission,
            label: args.label),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PermissionStatusViewArguments {
  const PermissionStatusViewArguments({
    this.key,
    this.isDark,
    this.fullAccessIsNeeded = false,
    required this.status,
    required this.permission,
    required this.label,
  });

  final _i4.Key? key;

  final bool? isDark;

  final bool fullAccessIsNeeded;

  final _i5.PermissionStatus status;

  final _i5.Permission permission;

  final String label;

  @override
  String toString() {
    return '{"key": "$key", "isDark": "$isDark", "fullAccessIsNeeded": "$fullAccessIsNeeded", "status": "$status", "permission": "$permission", "label": "$label"}';
  }

  @override
  bool operator ==(covariant PermissionStatusViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.isDark == isDark &&
        other.fullAccessIsNeeded == fullAccessIsNeeded &&
        other.status == status &&
        other.permission == permission &&
        other.label == label;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        isDark.hashCode ^
        fullAccessIsNeeded.hashCode ^
        status.hashCode ^
        permission.hashCode ^
        label.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPermissionStatusView({
    _i4.Key? key,
    bool? isDark,
    bool fullAccessIsNeeded = false,
    required _i5.PermissionStatus status,
    required _i5.Permission permission,
    required String label,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.permissionStatusView,
        arguments: PermissionStatusViewArguments(
            key: key,
            isDark: isDark,
            fullAccessIsNeeded: fullAccessIsNeeded,
            status: status,
            permission: permission,
            label: label),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPermissionStatusView({
    _i4.Key? key,
    bool? isDark,
    bool fullAccessIsNeeded = false,
    required _i5.PermissionStatus status,
    required _i5.Permission permission,
    required String label,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.permissionStatusView,
        arguments: PermissionStatusViewArguments(
            key: key,
            isDark: isDark,
            fullAccessIsNeeded: fullAccessIsNeeded,
            status: status,
            permission: permission,
            label: label),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
