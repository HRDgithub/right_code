import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/src/app/recipes/application/pagination/recipe_pagination_provider.dart';
import 'package:right_code_app/src/app/recipes/application/recipe_provider.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_category_model/recipe_category_model.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';
import 'package:right_code_app/src/app/recipes/presentation/widgets/recipe_card_widget.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/custom_category_widget_view.dart';
import 'package:right_code_app/widgets/custom_chips.dart';
import 'package:right_code_app/widgets/pagination/base_pagination_list_view.dart';
import 'package:right_code_app/widgets/text_field.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class RecipesPage extends ConsumerStatefulWidget {
  const RecipesPage({super.key});

  @override
  ConsumerState<RecipesPage> createState() => _MyRefrigeratorPageState();
}

class _MyRefrigeratorPageState extends ConsumerState<RecipesPage> {
  @override
  void initState() {
    if (context.mounted && ref.context.mounted) {
      ref.read(recipesPaginationProvider.notifier).initState();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (context.mounted && ref.context.mounted) {
      ref.read(recipesPaginationProvider.notifier).dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(recipesPaginationProvider.notifier);
    final state = ref.watch(recipesPaginationProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                "Recipes",
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              TextWidget(
                "List of shared Recipes",
                textOpacity: 0.8,
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                hintText: "Search",
                maxLines: 1,
                onChanged: (text) async {
                  if (text != null) {
                    await provider.updateSearchText(text);
                  }
                },
                suffixIcon: Visibility(
                  visible: state.searchText.text.trim().isNotEmpty,
                  child: BoxButton(
                    onPressed: () async {
                      await provider.resetAndLoadData();
                    },
                    width: 40,
                    height: 40,
                    raduis: AppTheme.raduisCirlce,
                    icon: Iconsax.receipt_search_outline,
                  ),
                ),
                margin: EdgeInsets.zero,
              )),
              const SizedBox(width: 10),
              BoxButton(
                onPressed: () async {
                  await provider.updateSortValue();
                },
                icon: Icons.sort_rounded,
                iconColor: AppTheme.whiteText,
                bgColor: AppTheme.primary,
                bgColorOpacity: 0.75,
                iconSize: 30,
              )
            ],
          ),
          SizedBox(
            height: 65,
            child: Consumer(builder: (context, ref, child) {
              return Row(
                children: [
                  CustomChipWidget(
                      isSelected: state.categorySearch == null,
                      onPressed: () async {
                        await provider.updateCategorySearchText(null);
                      },
                      title: "ALL"),
                  Expanded(
                    child: CustomCategoryStreamWidget<RecipeCategoryModel>(
                      dataProvider: getRecipesCategoryStreamProvider,
                      isSelected: (item) {
                        return item.name == state.categorySearch;
                      },
                      onPressed: (item) async {
                        await provider.updateCategorySearchText(item.name);
                      },
                      title: (item) {
                        return item.name;
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: BasePaginationListView<RecipeModel>(
            child: (context, index, item, items) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RecipeCardWidget(model: item),
              );
            },
            controller: state.controller,
            basePaginationProvider: provider,
          ))
        ],
      ),
    );
  }
}
