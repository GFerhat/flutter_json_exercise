import 'package:flutter/material.dart';

ListTileContainerDecoration getDarkListTileDeco() =>
    ListTileContainerDecoration(
      BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
      ),
    );

ListTileContainerDecoration getLightListTileDeco() =>
    ListTileContainerDecoration(
      BoxDecoration(
        border: Border.all(),
      ),
    );

class ListTileContainerDecoration
    extends ThemeExtension<ListTileContainerDecoration> {
  final BoxDecoration decoration;

  const ListTileContainerDecoration(this.decoration);

  @override
  ThemeExtension<ListTileContainerDecoration> copyWith() {
    return this;
  }

  @override
  ThemeExtension<ListTileContainerDecoration> lerp(
    covariant ThemeExtension<ListTileContainerDecoration>? other,
    double t,
  ) {
    return this;
  }
}
