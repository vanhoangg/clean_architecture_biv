import 'package:clean_architecture_biv/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../flavors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // List<Widget> colorBoxes = [
    // ColoredBox(
    //   color: AppTheme.of(context).themeData.theme.colorScheme.secondary,
    //   child: const Text('colorScheme.secondary'),
    // ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.colorScheme.background,
    //     child: const Text('colorScheme.background'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.scaffoldBackgroundColor,
    //     child: const Text('scaffoldBackgroundColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.cardColor,
    //     child: const Text('cardColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.dividerColor,
    //     child: const Text('dividerColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.focusColor,
    //     child: const Text('focusColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.hoverColor,
    //     child: const Text('hoverColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.highlightColor,
    //     child: const Text('highlightColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.splashColor,
    //     child: const Text('splashColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.unselectedWidgetColor,
    //     child: const Text('unselectedWidgetColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.disabledColor,
    //     child: const Text('disabledColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.secondaryHeaderColor,
    //     child: const Text('secondaryHeaderColor'),
    //   ),
    //   ColoredBox(
    //     color: AppTheme.of(context).themeData.theme.dialogBackgroundColor,
    //     child: const Text('dialogBackgroundColor'),
    //   ),
    // ];
    // AppTheme.of(context).themeData.theme.primaryTextTheme

    // AppTheme.of(context).themeData.theme.textTheme
    List<TextStyle?> textThemeStyles = [
      AppTheme.of(context).themeData.theme.textTheme.displayLarge,
      AppTheme.of(context).themeData.theme.textTheme.displayMedium,
      AppTheme.of(context).themeData.theme.textTheme.displaySmall,
      AppTheme.of(context).themeData.theme.textTheme.headlineMedium,
      AppTheme.of(context).themeData.theme.textTheme.headlineSmall,
      AppTheme.of(context).themeData.theme.textTheme.titleLarge,
      AppTheme.of(context).themeData.theme.textTheme.titleMedium,
      AppTheme.of(context).themeData.theme.textTheme.titleSmall,
      AppTheme.of(context).themeData.theme.textTheme.bodyLarge,
      AppTheme.of(context).themeData.theme.textTheme.bodyMedium,
      AppTheme.of(context).themeData.theme.textTheme.bodySmall,
      AppTheme.of(context).themeData.theme.textTheme.labelLarge,
      AppTheme.of(context).themeData.theme.textTheme.labelSmall,
    ];
    // AppTheme.of(context).themeData.theme.
    Map<String, Color> themeColors = {
      'primary': AppTheme.of(context).themeData.theme.colorScheme.primary,
      'secondary': AppTheme.of(context).themeData.theme.colorScheme.secondary,
      'background': AppTheme.of(context).themeData.theme.colorScheme.background,
      'error': AppTheme.of(context).themeData.theme.colorScheme.error,
      'onBackground':
          AppTheme.of(context).themeData.theme.colorScheme.onBackground,
      'onError': AppTheme.of(context).themeData.theme.colorScheme.onError,
      'scrim': AppTheme.of(context).themeData.theme.colorScheme.scrim,
      'surface': AppTheme.of(context).themeData.theme.colorScheme.surface,
      'scaffoldBackgroundColor':
          AppTheme.of(context).themeData.theme.scaffoldBackgroundColor,
      'cardColor': AppTheme.of(context).themeData.theme.cardColor,
      'dividerColor': AppTheme.of(context).themeData.theme.dividerColor,
      'focusColor': AppTheme.of(context).themeData.theme.focusColor,
      'hoverColor': AppTheme.of(context).themeData.theme.hoverColor,
      'highlightColor': AppTheme.of(context).themeData.theme.highlightColor,
      'splashColor': AppTheme.of(context).themeData.theme.splashColor,
      'unselectedWidgetColor':
          AppTheme.of(context).themeData.theme.unselectedWidgetColor,
      'disabledColor': AppTheme.of(context).themeData.theme.disabledColor,
      'secondaryHeaderColor':
          AppTheme.of(context).themeData.theme.secondaryHeaderColor,
      'dialogBackgroundColor':
          AppTheme.of(context).themeData.theme.dialogBackgroundColor,
    };
    // Log.d AppTheme
    const int numberOfSection = 2;
    final int numberOfItem = textThemeStyles.length + themeColors.length;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: AppTheme.of(context).themeData.theme.colorScheme.background,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numberOfSection, // Number of items in a row
                crossAxisSpacing: 10, // Spacing between items horizontally
                mainAxisSpacing: 10, // Spacing between items vertically
                childAspectRatio: 5, // Aspect ratio
              ),
              itemCount: numberOfItem, // Replace with your number of items
              itemBuilder: (context, index) {
                final int rowIndex = index % numberOfSection;

                switch (rowIndex) {
                  case 0:
                    final textThemeStylesIndex = index ~/ numberOfSection;
                    if (textThemeStylesIndex > textThemeStyles.length - 1) {
                      return Container();
                    }
                    final value = textThemeStyles[index ~/ numberOfSection];
                    final text = value?.debugLabel
                        ?.replaceAll(").apply).apply).merge(unknown)", "")
                        .split(' ')
                        .last;
                    return Text(text ?? "", style: value);
                  case 1:
                    final themeColorsIndex = index ~/ numberOfSection;
                    if (themeColorsIndex > themeColors.length - 1) {
                      return Container();
                    }
                    final key = themeColors.keys.elementAt(themeColorsIndex);
                    return Column(
                      children: [
                        Text(key),
                        Expanded(
                          child: ColoredBox(
                            color: themeColors[key] ?? Colors.black,
                            child: Container(),
                          ),
                        ),
                      ],
                    );
                  default:
                    return const Text('Unknown');
                }
              },
            )));
  }

  Center changeThemeButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            AppTheme.of(context).toggleTheme();
          });
        },
        child: Text('CLICK ME NOW ${F.title}',
            style: TextStyle(
              color: AppTheme.of(context)
                  .themeData
                  .theme
                  .primaryTextTheme
                  .displayLarge
                  ?.color,
              fontSize: 20,
            )),
      ),
    );
  }
}
