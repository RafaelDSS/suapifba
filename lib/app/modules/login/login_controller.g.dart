// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on LoginControllerBase, Store {
  final _$matriculaAtom = Atom(name: 'LoginControllerBase.matricula');

  @override
  String? get matricula {
    _$matriculaAtom.reportRead();
    return super.matricula;
  }

  @override
  set matricula(String? value) {
    _$matriculaAtom.reportWrite(value, super.matricula, () {
      super.matricula = value;
    });
  }

  final _$passwordAtom = Atom(name: 'LoginControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$rememberMeAtom = Atom(name: 'LoginControllerBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$isbuttonpressAtom = Atom(name: 'LoginControllerBase.isbuttonpress');

  @override
  bool get isbuttonpress {
    _$isbuttonpressAtom.reportRead();
    return super.isbuttonpress;
  }

  @override
  set isbuttonpress(bool value) {
    _$isbuttonpressAtom.reportWrite(value, super.isbuttonpress, () {
      super.isbuttonpress = value;
    });
  }

  final _$submitFormAsyncAction = AsyncAction('LoginControllerBase.submitForm');

  @override
  Future submitForm() {
    return _$submitFormAsyncAction.run(() => super.submitForm());
  }

  final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase');

  @override
  dynamic changeMatricula(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeMatricula');
    try {
      return super.changeMatricula(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRememberMe(bool value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeRememberMe');
    try {
      return super.changeRememberMe(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
matricula: ${matricula},
password: ${password},
rememberMe: ${rememberMe},
isbuttonpress: ${isbuttonpress}
    ''';
  }
}
