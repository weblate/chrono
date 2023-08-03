import 'dart:math';

import 'package:clock_app/common/utils/text_size.dart';
import 'package:clock_app/common/widgets/card_container.dart';
import 'package:clock_app/settings/types/setting_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RetypeTask extends StatefulWidget {
  const RetypeTask({
    Key? key,
    required this.onSolve,
    required this.settings,
  }) : super(key: key);

  final VoidCallback onSolve;
  final SettingGroup settings;

  @override
  State<RetypeTask> createState() => _RetypeTaskState();
}

class _RetypeTaskState extends State<RetypeTask> {
  final TextEditingController _textController = TextEditingController();
  late final int characterCount =
      widget.settings.getSetting("Number of characters").value.toInt();
  late final String string;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      if (_textController.text == string) {
        widget.onSolve.call();
      }
    });
    string = _generateRandomString(characterCount);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _random = Random();

  String _generateRandomString(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _random.nextInt(_chars.length),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    Size textSize =
        calcTextSizeFromLength(characterCount + 5, textTheme.displaySmall!);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Retype the characters below",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16.0),
          CardContainer(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      string,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: textSize.width + 16,
                      child: TextField(
                        controller: _textController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9]"))
                        ],
                        autofocus: true,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                        keyboardType: TextInputType.text,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
