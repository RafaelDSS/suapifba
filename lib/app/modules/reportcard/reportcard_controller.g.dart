// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportcard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportcardController on _ReportcardControllerBase, Store {
  final _$loadingAtom = Atom(name: '_ReportcardControllerBase.loading');

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

  final _$periodsAtom = Atom(name: '_ReportcardControllerBase.periods');

  @override
  List<Period>? get periods {
    _$periodsAtom.reportRead();
    return super.periods;
  }

  @override
  set periods(List<Period>? value) {
    _$periodsAtom.reportWrite(value, super.periods, () {
      super.periods = value;
    });
  }

  final _$notesAtom = Atom(name: '_ReportcardControllerBase.notes');

  @override
  List<ReportCard>? get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<ReportCard>? value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  final _$getPeriodsAsyncAction =
      AsyncAction('_ReportcardControllerBase.getPeriods');

  @override
  Future getPeriods(String? token) {
    return _$getPeriodsAsyncAction.run(() => super.getPeriods(token));
  }

  final _$getNotesAsyncAction =
      AsyncAction('_ReportcardControllerBase.getNotes');

  @override
  Future getNotes(String token, String period) {
    return _$getNotesAsyncAction.run(() => super.getNotes(token, period));
  }

  final _$_ReportcardControllerBaseActionController =
      ActionController(name: '_ReportcardControllerBase');

  @override
  dynamic changeLoading(bool value) {
    final _$actionInfo = _$_ReportcardControllerBaseActionController
        .startAction(name: '_ReportcardControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$_ReportcardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
periods: ${periods},
notes: ${notes}
    ''';
  }
}
