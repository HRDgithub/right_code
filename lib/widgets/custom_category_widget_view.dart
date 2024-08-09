import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/custom_chips.dart';
import 'package:right_code_app/widgets/loading_progress.dart';

class CustomCategoryStreamWidget<T> extends ConsumerWidget {
  final AutoDisposeStreamProvider<List<T>> dataProvider;
  final bool Function(T item) isSelected;
  final void Function(T item) onPressed;
  final String Function(T item) title;
  final String errorTitle;

  const CustomCategoryStreamWidget({
    super.key,
    required this.dataProvider,
    required this.isSelected,
    required this.onPressed,
    required this.title,
    this.errorTitle = 'No Categories Found',
  });

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(dataProvider);

    return data.when(
      data: (dataList) {
        return dataList.isEmpty
            ? CustomChipWidget(
                isSelected: false,
                onPressed: () async {},
                title: errorTitle,
              )
            : ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: dataList.map((e) {
                  return CustomChipWidget(
                    isSelected: isSelected(e),
                    onPressed: () => onPressed(e),
                    title: title(e),
                  );
                }).toList(),
              );
      },
      error: (error, stackTrace) => CustomChipWidget(
        isSelected: false,
        onPressed: () async {},
        title: errorTitle,
      ),
      loading: () => CustomChipWidget(
        isSelected: false,
        onPressed: () async {},
        title: '',
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: LoadingProgress(
            dimension: 20,
            color: AppTheme.buttonColor,
          ),
        ),
      ),
    );
  }
}
