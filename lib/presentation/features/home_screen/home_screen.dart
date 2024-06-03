import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:dartx/dartx.dart';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../flavors.dart';

enum TypeOfList { listView, gridView }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numberOfSection = 2;
  TypeOfList type = TypeOfList.gridView;

  @override
  Widget build(BuildContext context) {
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

    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: AppTheme.of(context).themeData.theme.colorScheme.background,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Theme: ${F.title}',
                          style: AppTheme.of(context)
                              .themeData
                              .theme
                              .textTheme
                              .displayLarge,
                        ),
                      ),
                      changeThemeButton(context,
                          title: "ListView",
                          onPressed: () => setState(() {
                                type = type == TypeOfList.listView
                                    ? TypeOfList.gridView
                                    : TypeOfList.listView;
                              })),
                      changeThemeButton(context,
                          title: "DarkMode",
                          onPressed: () => setState(() {
                                AppTheme.of(context).toggleTheme();
                              })),
                      changeThemeButton(context,
                          title: "+1 Row",
                          onPressed: () => setState(() {
                                if (type == TypeOfList.listView) {
                                  textThemeStyles.append(textThemeStyles);
                                  themeColors.addAll(themeColors);
                                } else {
                                  numberOfSection++;
                                }
                              })),
                    ]),
                  ),
                  SliverAlignedGrid.count(
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      crossAxisCount:
                          type == TypeOfList.listView ? 1 : numberOfSection,
                      itemCount: textThemeStyles.length + themeColors.length,
                      itemBuilder: (context, index) {
                        final int rowIndex = index % 2;
                        Log.d('rowIndex: $rowIndex');
                        switch (rowIndex) {
                          case 0:
                            final textThemeStylesIndex = index ~/ 2;
                            if (textThemeStylesIndex >
                                textThemeStyles.length - 1) {
                              return Container();
                            }
                            final value = textThemeStyles[index ~/ 2];
                            final text = value?.debugLabel
                                ?.replaceAll(
                                    ").apply).apply).merge(unknown)", "")
                                .split(' ')
                                .last
                                .split(')')
                                .first;
                            return Text(text ?? "", style: value);
                          case 1:
                            final themeColorsIndex = index ~/ 2;
                            Log.d('themeColorsIndex: $themeColorsIndex');
                            if (themeColorsIndex > themeColors.length - 1) {
                              return Container();
                            }
                            final key =
                                themeColors.keys.elementAt(themeColorsIndex);
                            final value =
                                themeColors.values.elementAt(themeColorsIndex);
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(key),
                                ColoredBox(
                                  color: value,
                                  child: Container(
                                    height: 50,
                                  ),
                                ),
                              ],
                            );
                          default:
                            return const Text('Unknown');
                        }
                      }),
                ],
              ),
            )));
  }

  Widget changeThemeButton(BuildContext context,
      {String? title, Function()? onPressed}) {
    return TextButton(
      onPressed: () => onPressed?.call(),
      child: Text('CLICK ME NOW $title',
          style: TextStyle(
            color: AppTheme.of(context)
                .themeData
                .theme
                .primaryTextTheme
                .displayLarge
                ?.color,
            fontSize: 20,
          )),
    );
  }
}
