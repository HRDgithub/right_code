import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:right_code_app/widgets/loading_progress.dart';
import 'package:right_code_app/widgets/pagination/base_pagination_provier.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class BasePaginationListView<T> extends StatelessWidget {
  const BasePaginationListView({
    super.key,
    required this.child,
    required this.controller,
    this.loadingWidget,
    this.initLoadingWidget,
    required this.basePaginationProvider,
  });

  final BasePaginationProvider<T> basePaginationProvider;
  final ScrollController controller;
  final Widget? loadingWidget;
  final Widget? initLoadingWidget;
  final Widget Function(BuildContext context, int index, T item, List<T> items)
      child;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final paginationState = basePaginationProvider;
      final items = paginationState.items;
      return Center(
        child: paginationState.isLoading == true
            ? initLoadingWidget ?? const LoadingProgress()
            : items.isEmpty
                ? const TextWidget(
                    "No Data",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )
                : ListView.builder(
                    padding: const EdgeInsetsDirectional.only(bottom: 100),
                    itemCount:
                        items.length + (paginationState.hasNextPage ? 1 : 0),
                    controller: controller,
                    itemBuilder: (context, index) {
                      if (index == items.length) {
                        if (!paginationState.hasNextPage) {
                          return const SizedBox();
                        }
                        return paginationState.isLoadMoreRunning
                            ? loadingWidget ??
                                const Center(
                                  child: LoadingProgress(
                                    dimension: 45,
                                  ),
                                )
                            : null;
                      }
                      final item = items[index];
                      if (items.isNotEmpty) {
                        return child(context, index, item, items);
                      }

                      return const Center(
                        child: TextWidget("Error Loading Data"),
                      );
                    },
                  ),
      );
    });
  }
}
