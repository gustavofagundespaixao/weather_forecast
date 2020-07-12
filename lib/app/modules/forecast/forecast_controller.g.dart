// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForecastController on _ForecastControllerBase, Store {
  final _$itemsAtom = Atom(name: '_ForecastControllerBase.items');

  @override
  ObservableFuture<ForecastModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableFuture<ForecastModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_ForecastControllerBase.get');

  @override
  Future<ForecastModel> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
