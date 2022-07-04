import 'dart:ui';

//Packages

import 'package:geek_task/models/event.dart' as evnt;
import 'package:geek_task/models/main_page_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geek_task/util/color_palette.dart';
import 'package:geek_task/util/styles.dart';

//Widgets
import '../widgets/event_tile.dart';



//Controllers
import 'package:geek_task/controllers/main_page_data_controller.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController>((ref) {
  return MainPageDataController();
});

class MainPage extends ConsumerWidget {
  double _deviceHeight;
  double _deviceWidth;

  MainPageDataController _mainPageDataController;
  MainPageData _mainPageData;

  TextEditingController _searchTextFieldController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    _mainPageDataController = watch(mainPageDataControllerProvider);
    _mainPageData = watch(mainPageDataControllerProvider.state);

    _searchTextFieldController = TextEditingController();

    _searchTextFieldController.text = _mainPageData.searchText;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[_foregroundWidgets()],
        ),
      ),
    );
  }

  Widget _foregroundWidgets() {
    return Container(
      // width: _deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),
          Container(
            height: _deviceHeight * .83,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * .01),
            child: _eventsListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
     // height: _deviceHeight * 0.08,
      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Palette.darkBlue,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _searchFieldWidget(),
          _cancelWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
       // width: _deviceWidth * .5,
      //  height: _deviceHeight * .05,
        child: TextField(
            controller: _searchTextFieldController,
            onChanged: (_input) =>
                _mainPageDataController.updateTextSearch(_input),
            style: TextStyle(color: Colors.white),
            decoration: kSearchFieldDecoration),
      ),
    );
  }


  GestureDetector _cancelWidget() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: 100,
        child: Text(
          'Cancel',
          style: bodyText_4,
        ),
      ),
    );
  }

  Widget _eventsListViewWidget() {
    final List<evnt.Event> _events = _mainPageData.events;

    if (_events.length != 0) {
      return NotificationListener(
        onNotification: (_onScrollNotification) {
          if (_onScrollNotification is ScrollEndNotification) {
            final before = _onScrollNotification.metrics.extentBefore;
            final max = _onScrollNotification.metrics.maxScrollExtent;
            if (before == max) {
              _mainPageDataController.getEvents();
              return true;
            } else {
              return false;
            }
          } else {
            print('check: end');
            return false;
          }
        },
        child: ListView.builder(
            itemCount: _events.length,
            itemBuilder: (BuildContext _context, int _count) {
              print('${_events.length}');
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _deviceHeight * .01, horizontal: 0),
                child: GestureDetector(
                  onTap: () {
                    //  _selectedMoviePosterURL.state = _events[_count].posterURL();
                  },
                  child: EventTile(
                    event: _events[_count],
                    height: _deviceHeight * 0.2,
                    width: _deviceWidth * 0.85,
                  ),
                ),
              );
            }),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
