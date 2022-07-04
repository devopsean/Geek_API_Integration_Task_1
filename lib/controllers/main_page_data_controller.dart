//Packages

import 'package:geek_task/models/event.dart';
import 'package:geek_task/models/search_category.dart';
import 'package:geek_task/services/event_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

//Models
import 'package:geek_task/models/main_page_data.dart';

//Services

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData state])
      : super(state ?? MainPageData.initial()) {
    getEvents();
  }
  final EventService _eventService = GetIt.instance.get<EventService>();

  Future<void> getEvents() async {
    try {
      List<Event> _events = [];
      //if statements to update movie on screen after getting earlier
      // if (state.searchText.isEmpty) {
      //   if (state.searchCategory == SearchCategory.popular) {
      //     _movies = await _movieService.getPopularMovies(page: state.page);
      //   } else if (state.searchCategory == SearchCategory.upcoming) {
      //     _movies = await _movieService.getUpcomingMovies(page: state.page);
      //   }
      //   //for safe check
      //
      //   else if (state.searchCategory == SearchCategory.none) {
      //     _movies = [];
      //   }
      // } else {
      //   _movies = await _movieService.searchMovies(state.searchText);
      //
      // }

      var yo =
          await _eventService.searchEvents(state.searchText, page: state.page);
      _events = yo.events;

      state = state.copyWith(
          events: [...state.events, ..._events], page: state.page + 1);
    } catch (e) {
      print('check: controller error is $e');
    }
  }


  void updateTextSearch(String _searchText) {
    try {
      state.copyWith(events: [], page: 1, searchText: _searchText);

      state.searchText = _searchText;
      state.events = [];
      state.page = 1;



      getEvents();
    } catch (e) {
      print('PROBLEMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM na: $e');
    }
  }
}
