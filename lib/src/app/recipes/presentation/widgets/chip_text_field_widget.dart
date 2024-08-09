import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:right_code_app/theme/theme.dart';
import 'package:right_code_app/utils/context_extantions.dart';
import 'package:right_code_app/widgets/box_button.dart';
import 'package:right_code_app/widgets/text_field.dart';
import 'package:right_code_app/widgets/text_widget.dart';

class ChipTextFieldWidget extends HookWidget {
  const ChipTextFieldWidget({
    super.key,
    this.validator,
    required this.onChipListChanged,
    required this.labelText,
    this.defaultChips = const [],
    this.hintText,
  });

  final String labelText;
  final String? Function(String?)? validator;
  final String? hintText;
  final List<String> defaultChips;
  final void Function(List<String> value) onChipListChanged;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final textControllerListner = useValueListenable(textController);
    final chipsListUseState = useState<List<String>>(defaultChips);

    useEffect(() {
      textController.value = textControllerListner;
      return () {};
    }, [textControllerListner]);

    void addChip(String text) {
      if (!chipsListUseState.value.contains(text)) {
        chipsListUseState.value = [...chipsListUseState.value, text];
      }
    }

    void removeChip(String text) {
      chipsListUseState.value =
          chipsListUseState.value.where((chip) => chip != text).toList();
    }

    return Column(
      children: [
        CustomTextField(
          validator: validator,
          controller: textController,
          margin: EdgeInsets.zero,
          lableText: labelText,
          maxLines: 1,
          suffixIcon: BoxButton(
            width: 40,
            height: 40,
            raduis: AppTheme.raduisCirlce,
            onPressed: () {
              final text = textController.text.trim().trimRight().trimLeft();
              if (text.isNotEmpty) {
                addChip(text);
                textController.clear();
                onChipListChanged(chipsListUseState.value);
              }
            },
            icon: Iconsax.add_circle_outline,
            iconSize: 25,
          ),
        ),
        Visibility(
          visible: chipsListUseState.value.isNotEmpty,
          child: SizedBox(
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: chipsListUseState.value.map(
                  (chip) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2.5, vertical: 2.5),
                      child: Chip(
                        label: TextWidget(
                          chip,
                          textColor: AppTheme.whiteText,
                        ),
                        backgroundColor: AppTheme.buttonColor,
                        deleteIcon: const Icon(
                          Icons.close_rounded,
                          color: AppTheme.whiteText,
                        ),
                        onDeleted: () {
                          removeChip(chip);
                          onChipListChanged(chipsListUseState.value);
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
