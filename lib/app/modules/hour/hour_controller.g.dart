// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HourController on _HourControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HourControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$periodsAtom = Atom(name: '_HourControllerBase.periods');

  @override
  List<Period> get periods {
    _$periodsAtom.reportRead();
    return super.periods;
  }

  @override
  set periods(List<Period> value) {
    _$periodsAtom.reportWrite(value, super.periods, () {
      super.periods = value;
    });
  }

  final _$hoursClassAtom = Atom(name: '_HourControllerBase.hoursClass');

  @override
  List<List<dynamic>> get hoursClass {
    _$hoursClassAtom.reportRead();
    return super.hoursClass;
  }

  @override
  set hoursClass(List<List<dynamic>> value) {
    _$hoursClassAtom.reportWrite(value, super.hoursClass, () {
      super.hoursClass = value;
    });
  }

  final _$getPeriodsAsyncAction = AsyncAction('_HourControllerBase.getPeriods');

  @override
  Future getPeriods(String token) {
    return _$getPeriodsAsyncAction.run(() => super.getPeriods(token));
  }

  final _$getVirtualClassesAsyncAction =
      AsyncAction('_HourControllerBase.getVirtualClasses');

  @override
  Future getVirtualClasses(String token, String period) {
    return _$getVirtualClassesAsyncAction
        .run(() => super.getVirtualClasses(token, period));
  }

  final _$_HourControllerBaseActionController =
      ActionController(name: '_HourControllerBase');

  @override
  dynamic changeLoading(bool value) {
    final _$actionInfo = _$_HourControllerBaseActionController.startAction(
        name: '_HourControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$_HourControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
periods: ${periods},
hoursClass: ${hoursClass}
    ''';
  }
}
