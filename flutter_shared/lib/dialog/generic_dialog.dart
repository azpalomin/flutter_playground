import 'package:flutter/material.dart';
import 'package:flutter_shared/widgets/buttons/primary_button.dart';
import 'package:flutter_shared/widgets/buttons/secondary_button.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
  //First option entered is the primary option
}) {
  final options = optionsBuilder();
  final optionsKeys = options.keys;
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 40,
              height: 40,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                size: 20,
              ),
            ),
          ],
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 375),
          child: Text(
            content,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          Column(
            children: [
              PrimaryButton(
                onPressed: () => Navigator.of(context).pop(options[optionsKeys.elementAt(0)]),
                text: optionsKeys.elementAt(0),
              ),
              const SizedBox(height: 8),
              if (optionsKeys.length == 2)
                TextButton(
                  onPressed: () => Navigator.of(context).pop(options[optionsKeys.elementAt(1)]),
                  child: Text(
                    optionsKeys.elementAt(1),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              if (optionsKeys.length > 2) ...[
                for (int i = 1; i < optionsKeys.length - 1; i++)
                  SecondaryButton(
                    onPressed: () => Navigator.of(context).pop(options[optionsKeys.elementAt(i)]),
                    text: optionsKeys.elementAt(i),
                  ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(options[optionsKeys.last]),
                  child: Text(
                    optionsKeys.last,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ],
          ),
        ],
      );
    },
  );
}
