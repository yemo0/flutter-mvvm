import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationBarEvent { HOME, MY }

final navigationProvider = StateNotifierProvider<NavigationNotifier, PageModel>(
    (ref) => NavigationNotifier());

class NavigationNotifier extends StateNotifier<PageModel> {
  NavigationNotifier() : super(defaultPage);

  static const defaultPage = PageModel(NavigationBarEvent.HOME, 0);

  void selectPage(int i) {
    switch (1) {
      case 0:
        state = PageModel(NavigationBarEvent.HOME, i);
        break;
      case 1:
        state = PageModel(NavigationBarEvent.MY, i);
        break;
    }
  }
}

class PageModel {
  const PageModel(this.page, this.index);
  final NavigationBarEvent page;
  final index;
}
