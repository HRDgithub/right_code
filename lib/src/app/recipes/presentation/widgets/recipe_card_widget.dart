// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/src/app/recipes/application/recipe_controller.dart';
import 'package:right_code_app/src/app/recipes/domain/recipe_model/recipe_model.dart';
import 'package:right_code_app/src/app/recipes/presentation/add_edit_item_recipes_page.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/utils/context_extantions.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/image_widgets.dart';
import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget({
    super.key,
    required this.model,
  });
  final RecipeModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: AppTheme.raduis,
        color: AppTheme.whiteText,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              color: AppTheme.buttonColor.withOpacity(0.5),
            ),
            child: CustomImageNetwork(
              dimension: 350,
              url: model.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      model.name,
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                    Visibility(
                      visible: model.details != null,
                      child: TextWidget(
                        model.details.toString(),
                        maxLines: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Consumer(builder: (context, ref, child) {
                final state = ref.watch(recipeItemController(model.id));
                final provider =
                    ref.read(recipeItemController(model.id).notifier);
                return Row(
                  children: [
                    BoxButton(
                      width: 35,
                      height: 35,
                      icon: Iconsax.edit_outline,
                      loading: state.edit.isLoading,
                      bgColor: AppTheme.primary,
                      onPressed: () async {
                        await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AddEditItemRecipesPage(
                              editedModel: model,
                            );
                          },
                        ));
                      },
                    ),
                    const SizedBox(width: 5),
                    BoxButton(
                      width: 35,
                      height: 35,
                      loading: state.delete.isLoading,
                      icon: Iconsax.trash_outline,
                      bgColor: Colors.red,
                      onPressed: () async {
                        await showWarningDialog(
                          header: "Delete Item",
                          title: "Do you want to delete this item ?",
                          buttonText: "Yes",
                          status: AlertDialogStatus.action,
                          onActionPressed: () async {
                            await provider.removeItem(model.id);
                          },
                        );
                      },
                    ),
                  ],
                );
              })
            ],
          ),
          Visibility(
            visible: model.ingredients.isNotEmpty,
            child: SizedBox(
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: model.ingredients.map(
                    (chip) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5, top: 5),
                        child: Chip(
                          label:
                              TextWidget(chip, textColor: AppTheme.whiteText),
                          backgroundColor: AppTheme.buttonColor,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
