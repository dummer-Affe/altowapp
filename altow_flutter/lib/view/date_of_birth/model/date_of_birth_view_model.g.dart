// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_of_birth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DateOfBirthViewModel on _DateOfBirthViewModelBase, Store {
  late final _$focusedPartIndexAtom = Atom(
      name: '_DateOfBirthViewModelBase.focusedPartIndex', context: context);

  @override
  int get focusedPartIndex {
    _$focusedPartIndexAtom.reportRead();
    return super.focusedPartIndex;
  }

  @override
  set focusedPartIndex(int value) {
    _$focusedPartIndexAtom.reportWrite(value, super.focusedPartIndex, () {
      super.focusedPartIndex = value;
    });
  }

  late final _$dayAtom =
      Atom(name: '_DateOfBirthViewModelBase.day', context: context);

  @override
  int? get day {
    _$dayAtom.reportRead();
    return super.day;
  }

  @override
  set day(int? value) {
    _$dayAtom.reportWrite(value, super.day, () {
      super.day = value;
    });
  }

  late final _$monthAtom =
      Atom(name: '_DateOfBirthViewModelBase.month', context: context);

  @override
  int? get month {
    _$monthAtom.reportRead();
    return super.month;
  }

  @override
  set month(int? value) {
    _$monthAtom.reportWrite(value, super.month, () {
      super.month = value;
    });
  }

  late final _$yearAtom =
      Atom(name: '_DateOfBirthViewModelBase.year', context: context);

  @override
  int? get year {
    _$yearAtom.reportRead();
    return super.year;
  }

  @override
  set year(int? value) {
    _$yearAtom.reportWrite(value, super.year, () {
      super.year = value;
    });
  }

  late final _$setBirthdateAsyncAction =
      AsyncAction('_DateOfBirthViewModelBase.setBirthdate', context: context);

  @override
  Future<void> setBirthdate(BuildContext context) {
    return _$setBirthdateAsyncAction.run(() => super.setBirthdate(context));
  }

  late final _$_DateOfBirthViewModelBaseActionController =
      ActionController(name: '_DateOfBirthViewModelBase', context: context);

  @override
  void focusPart(int index, BuildContext context) {
    final _$actionInfo = _$_DateOfBirthViewModelBaseActionController
        .startAction(name: '_DateOfBirthViewModelBase.focusPart');
    try {
      return super.focusPart(index, context);
    } finally {
      _$_DateOfBirthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectDay(int day) {
    final _$actionInfo = _$_DateOfBirthViewModelBaseActionController
        .startAction(name: '_DateOfBirthViewModelBase.selectDay');
    try {
      return super.selectDay(day);
    } finally {
      _$_DateOfBirthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYear(int year) {
    final _$actionInfo = _$_DateOfBirthViewModelBaseActionController
        .startAction(name: '_DateOfBirthViewModelBase.setYear');
    try {
      return super.setYear(year);
    } finally {
      _$_DateOfBirthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectMonth(int month) {
    final _$actionInfo = _$_DateOfBirthViewModelBaseActionController
        .startAction(name: '_DateOfBirthViewModelBase.selectMonth');
    try {
      return super.selectMonth(month);
    } finally {
      _$_DateOfBirthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
focusedPartIndex: ${focusedPartIndex},
day: ${day},
month: ${month},
year: ${year}
    ''';
  }
}
