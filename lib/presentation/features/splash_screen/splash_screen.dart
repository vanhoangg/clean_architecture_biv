import 'package:clean_architecture_biv/presentation/features/base/base_stateful_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/shared.dart';

class NavigationHeader {
  final String title;
  final GlobalKey key;
  NavigationHeader({required this.title, required this.key});
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    const defaultSpacingHorizontal = SizedBox(
      width: 16,
    );
    final List<NavigationHeader> listTitle = [
      NavigationHeader(key: GlobalKey(debugLabel: "About"), title: "About"),
      NavigationHeader(key: GlobalKey(debugLabel: "Project"), title: "Project")
    ];
    return Scaffold(
        backgroundColor: appTheme.themeData.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Icon(Icons.logo_dev,
              color: appTheme.themeData.theme.colorScheme.inverseSurface),
          backgroundColor: Colors.transparent,
          actions: [
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Center(
                      child: TextButton(
                        onPressed: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.linear);
                        },
                        child: Text(
                          listTitle[index].title,
                          style: appTheme.themeData.theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => defaultSpacingHorizontal,
                itemCount: listTitle.length),
            defaultSpacingHorizontal,
            Text("|", style: appTheme.themeData.theme.textTheme.titleMedium),
            defaultSpacingHorizontal,
            IconButton(
                color: appTheme.themeData.theme.colorScheme.inverseSurface,
                onPressed: () => {
                      setState(() {
                        appTheme.toggleTheme();
                      })
                    },
                icon: const Icon(Icons.brightness_medium_outlined)),
            TextButton(
                onPressed: () => {print("ABC")},
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appTheme.themeData.theme.colorScheme.primary,
                    ),
                    child: Text(
                      "Download CV",
                      style: appTheme.themeData.theme.textTheme.titleMedium,
                    )))
          ],
        ),
        body: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: listTitle.length,
          itemBuilder: (context, index) => Container(
            key: listTitle[index].key,
            height: MediaQuery.sizeOf(context).height,
            color: ColorX.random,
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            context.go(ScreenName.root + ScreenName.home);
          },
          child: const Text('Go to Home'),
        ));
  }
}
