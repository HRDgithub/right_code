import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:right_code_app/dep_injection.dart';
import 'package:right_code_app/utils/prints.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BasePaginationProvider<T> extends ChangeNotifier {
  int _page = 0;
  final int limit;
  List<T> _items = [];
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  bool _isLoading = false;

  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;

  BasePaginationProvider({required this.limit});

  final supabase = getIt<Supabase>();

  //* Realtime Channels
  late RealtimeChannel realtime;

  void listenToNewTableChanges();

  void initState() {
    try {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await initialFetchData();
        listenToNewTableChanges();
        controller.addListener(() async {
          if (controller.hasClients &&
              controller.position.pixels >=
                  controller.position.maxScrollExtent) {
            pCorrect("Load More", "${controller.position.pixels.toInt()}");
            await loadMore();
          }
        });
      });
    } catch (e) {
      pError("initState", e);
    }
  }

  @override
  void dispose() {
    try {
      realtime.unsubscribe();
      controller.dispose();
      pWarning("Widget Is Disposed", "Base Pagination");
    } catch (e) {
      pError("Base Pagination widget on dispose", e);
    }
    super.dispose();
  }

  List<T> get items => _items;
  bool get hasNextPage => _hasNextPage;
  bool get isLoadMoreRunning => _isLoadMoreRunning;
  bool get isLoading => _isLoading;

  set items(List<T> newItems) {
    _items = newItems;
    notifyListeners(); // Assuming you have a notifyListeners method
  }

  void setLoadingState(bool value) {
    _isLoading = value;
  }

  Future<void> resetAndLoadData() async {
    try {
      setLoadingState(true);
      _page = 0;
      _items.clear();
      _hasNextPage = true;
      await loadMore();
    } catch (e) {
      handleError(e);
    } finally {
      setLoadingState(false);
    }
  }

  Future<void> initialFetchData() async {
    try {
      setLoadingState(true);
      await loadMore();
    } catch (e) {
      handleError(e);
    } finally {
      setLoadingState(false);
    }
  }

  Future<List<T>> fetchItems(int from, int to);

  Future<void> loadMore() async {
    if (_hasNextPage && !_isLoadMoreRunning) {
      _isLoadMoreRunning = true;
      notifyListeners();
      final from = _page * limit;
      final to = from + limit;
      pCorrect("FROM - TO", "$from --- $to");
      try {
        final fetchedItems = await fetchItems(from, to);
        if (fetchedItems.isNotEmpty) {
          final newData = <T>{..._items, ...fetchedItems}.toList();
          _page += 1;
          _items = newData;
          _hasNextPage = (fetchedItems.length >= limit);
        } else {
          _hasNextPage = (fetchedItems.length <= limit);
        }
      } catch (err) {
        handleError(err);
      } finally {
        _isLoadMoreRunning = false;
        notifyListeners();
      }
    }
  }

  Future<void> handleError(dynamic error) async {
    // Handle errors here
    pError("Handle Error Base Pagination Provider", error);
  }

  Future<void> checkEventType(
      PostgresChangeEvent eventType, PostgresChangePayload payload) async {
    switch (eventType) {
      case PostgresChangeEvent.insert:
        await handleInsertEvent(payload.newRecord);
        break;
      case PostgresChangeEvent.update:
        await handleUpdateEvent(payload.newRecord);
        break;
      case PostgresChangeEvent.delete:
        await handleDeleteEvent(payload.oldRecord);
        break;
      default:
        pError("CheckEventType Error", "No Check Event Type");
        break;
    }
    notifyListeners();
  }

  Future<void> checkEventTypeMap(
      PostgresChangeEvent eventType, Map<String, dynamic> payload) async {
    pCorrect("Event Type", eventType);
    switch (eventType) {
      case PostgresChangeEvent.insert:
        await handleInsertEvent(payload["newRow"]);
        break;
      case PostgresChangeEvent.update:
        await handleUpdateEvent(payload["newRow"]);
        break;
      case PostgresChangeEvent.delete:
        await handleDeleteEvent(payload["oldRow"]);
        break;
      default:
        pError("CheckEventType Error", "No Check Event Type");
        break;
    }
    notifyListeners();
  }

  Future<void> handleInsertEvent(Map<String, dynamic> payload);

  Future<void> handleUpdateEvent(Map<String, dynamic> payload);

  Future<void> handleDeleteEvent(Map<String, dynamic> payload);
}
