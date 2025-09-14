import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TabControllerProvider with ChangeNotifier {
  int _currentIndex = 0;
  TabController? _tabController;

  int get currentIndex => _currentIndex;

  void setController(TabController controller) {
    // Remove listener from old controller if exists
    if (_tabController != null && _tabController!.hasListeners) {
      _tabController!.removeListener(_handleTabChange);
    }

    _tabController = controller;
    _tabController!.addListener(_handleTabChange);
    _currentIndex = _tabController!.index; // Sync initial index
  }

  void changeIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      _tabController?.animateTo(index);
      notifyListeners();
    }
  }

  void _handleTabChange() {
    if (_tabController != null && _currentIndex != _tabController!.index) {
      _currentIndex = _tabController!.index;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    if (_tabController != null && _tabController!.hasListeners) {
      _tabController!.removeListener(_handleTabChange);
    }
    super.dispose();
  }
}