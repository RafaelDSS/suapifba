import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/shared/components/snackbar_error.dart';

Disposer defaultStoreObserver(
    {required BuildContext context,
    required StreamStore store,
    required Function onLoading}) {
  final _disposer = store.observer(
    onLoading: (isLoading) => onLoading(isLoading),
    onError: (onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBarError(store.error.toString()));
    },
  );
  return _disposer;
}
