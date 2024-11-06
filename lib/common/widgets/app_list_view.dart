import 'package:flutter/widgets.dart';

class AppListView<T> extends StatelessWidget {
  const AppListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.emptyBuilder,
    this.controller,
    this.padding = const EdgeInsets.only(bottom: 40),
    this.spacing = 8,
    this.scrollDirection = Axis.vertical,
    this.storeState = false,
    this.clipBehavior = Clip.hardEdge,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context)? emptyBuilder;

  final Axis scrollDirection;
  final ScrollController? controller;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final bool storeState;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return emptyBuilder?.call(context) ?? const SizedBox.shrink();
    }

    return ListView.separated(
      key: storeState ? PageStorageKey(items.hashCode) : null,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      controller: controller,
      padding: padding,
      itemCount: items.length,
      scrollDirection: scrollDirection,
      itemBuilder: (c, i) => itemBuilder(c, items[i], i),
      clipBehavior: clipBehavior,
      separatorBuilder: (_, __) => switch (scrollDirection) {
        Axis.horizontal => SizedBox(width: spacing),
        Axis.vertical => SizedBox(height: spacing)
      },
    );
  }
}
