//Models
import 'package:geek_task/models/event.dart';

import 'package:geek_task/models/search_category.dart';
import 'package:geek_task/pages/main_page.dart';

class MainPageData {

   List<Event> events;
   int page;

   String searchText;

  MainPageData({this.events, this.page,  this.searchText});

  MainPageData.initial()
      : events = [],
        page = 1,

        searchText = '';

  MainPageData copyWith(
      {
      List<Event> events,
      int page,
      String searchText}) {
    return MainPageData(

        events: events ?? this.events,
        page: page ?? this.page,

        searchText: searchText ?? this.searchText);
  }
}
