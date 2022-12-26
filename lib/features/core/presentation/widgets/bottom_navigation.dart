import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_picker/features/core/utils/extensions/build_context_extensions.dart';
import 'package:gender_picker/features/gender_picker/presentation/screens/gender_picker_screen.dart';
import 'package:gender_picker/features/home/presentation/screens/home_screen.dart';
import 'package:gender_picker/features/home/router.dart';
import 'package:go_router/go_router.dart';

final navigationBarTabProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(navigationBarTabProvider);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.tr.homeTabLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business),
          label: context.tr.pickerLabel,
        ),
      ],
      currentIndex: currentTab,
      onTap: (int idx) => _onTabTapped(idx, ref, context),
    );
  }

  void _onTabTapped(
    int idx,
    WidgetRef ref,
    BuildContext context,
  ) {
    ref.read(navigationBarTabProvider.notifier).state = idx;
    switch (idx) {
      case 0:
        GoRouter.of(context).go(HomeScreen.route);
        break;
      case 1:
        GoRouter.of(context).go(GenderPickerScreen.route);
        break;
    }
  }
}
