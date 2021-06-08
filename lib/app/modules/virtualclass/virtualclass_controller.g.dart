// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtualclass_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VirtualClassController on _VirtualClassControllerBase, Store {
  final _$loadingAtom = Atom(name: '_VirtualClassControllerBase.loading');

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

  final _$periodsAtom = Atom(name: '_VirtualClassControllerBase.periods');

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

  final _$virtualClassesAtom =
      Atom(name: '_VirtualClassControllerBase.virtualClasses');

  @override
  List<ListVirtualClass> get virtualClasses {
    _$virtualClassesAtom.reportRead();
    return super.virtualClasses;
  }

  @override
  set virtualClasses(List<ListVirtualClass> value) {
    _$virtualClassesAtom.reportWrite(value, super.virtualClasses, () {
      super.virtualClasses = value;
    });
  }

  final _$getPeriodsAsyncAction =
      AsyncAction('_VirtualClassControllerBase.getPeriods');

  @override
  Future getPeriods(String token) {
    return _$getPeriodsAsyncAction.run(() => super.getPeriods(token));
  }

  final _$getVirtualClassesAsyncAction =
      AsyncAction('_VirtualClassControllerBase.getVirtualClasses');

  @override
  Future getVirtualClasses(String token, String period) {
    return _$getVirtualClassesAsyncAction
        .run(() => super.getVirtualClasses(token, period));
  }

  final _$getVirtualClassAsyncAction =
      AsyncAction('_VirtualClassControllerBase.getVirtualClass');

  @override
  Future getVirtualClass(String token, String code) {
    return _$getVirtualClassAsyncAction
        .run(() => super.getVirtualClass(token, code));
  }

  final _$_VirtualClassControllerBaseActionController =
      ActionController(name: '_VirtualClassControllerBase');

  @override
  dynamic changeLoading(bool value) {
    final _$actionInfo = _$_VirtualClassControllerBaseActionController
        .startAction(name: '_VirtualClassControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$_VirtualClassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
periods: ${periods},
virtualClasses: ${virtualClasses}
    ''';
  }
}
