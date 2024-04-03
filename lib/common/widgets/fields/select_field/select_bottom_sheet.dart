import 'package:clock_app/common/types/file_item.dart';
import 'package:clock_app/common/types/select_choice.dart';
import 'package:clock_app/common/widgets/fields/select_field/option_cards/audio_option_card.dart';
import 'package:clock_app/common/widgets/fields/select_field/option_cards/color_option_card.dart';
import 'package:clock_app/common/widgets/fields/select_field/option_cards/text_option_card.dart';
import 'package:flutter/material.dart';

class SelectBottomSheet extends StatelessWidget {
  const SelectBottomSheet({
    super.key,
    required this.title,
    this.description,
    required this.choices,
    required this.currentSelectedIndices,
    required this.onSelect,
    this.multiSelect = false,
  });

  final String title;
  final String? description;
  final List<SelectChoice> choices;
  final List<int> currentSelectedIndices;
  final bool multiSelect;
  final void Function(List<int>) onSelect;

  Widget _getOptionCard() {
    if (choices[0].value is Color) {
      return GridView.builder(
        itemCount: choices.length,
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return SelectColorOptionCard(
            index: index,
            choice: choices[index],
            isSelected: currentSelectedIndices.contains(index),
            onSelect: onSelect,
          );
        },
      );
    }

    if (choices[0].value is FileItem) {
      return ListView.builder(
          itemCount: choices.length,
          itemBuilder: (context, index) {
            return SelectAudioOptionCard(
              index: index,
              choice: choices[index],
              selectedIndices: currentSelectedIndices,
              multiSelect: multiSelect,
              onSelect: onSelect,
            );
          });
    }

    return ListView.builder(
        itemCount: choices.length,
        itemBuilder: (context, index) {
          return SelectTextOptionCard(
            index: index,
            choice: choices[index],
            multiSelect: multiSelect,
            selectedIndices: currentSelectedIndices,
            onSelect: onSelect,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    BorderRadiusGeometry borderRadius = theme.cardTheme.shape != null
        ? (theme.cardTheme.shape as RoundedRectangleBorder).borderRadius
        : BorderRadius.circular(8.0);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
        ),
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            SizedBox(
              height: 4.0,
              width: 48,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6)),
                  ),
                  if (description != null) const SizedBox(height: 8.0),
                  if (description != null)
                    Text(
                      description!,
                      style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6)),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Flexible(
              child: _getOptionCard(),
            ),
            // if (multiSelect) const SizedBox(height: 8.0),
            if (multiSelect)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom: 4.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          onSelect([]);
                        },
                        icon: Icon(Icons.clear_rounded, color: colorScheme.primary),
                      ),
                      IconButton(
                        onPressed: () {
                          onSelect([for (var i = 0; i < choices.length; i += 1) i]);
                        },
                        icon: Icon(Icons.select_all_rounded, color: colorScheme.primary),
                      ),
                    ],
                  ),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                    }, child: Text('Save',
                              style: textTheme.labelMedium?.copyWith(
                                  color:colorScheme.primary))),
                ]),
              )
          ],
        ),
      ),
    );
  }
}
