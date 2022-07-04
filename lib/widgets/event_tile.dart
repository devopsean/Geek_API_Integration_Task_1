//Packages
import 'package:geek_task/models/event.dart' as evnt;
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  final double height;
  final double width;
  final evnt.Event event;

  EventTile({this.event, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _eventPosterWidget(event.performers[0].image),
          _eventInfoWidget()
        ],
      ),
    );
  }

  Widget _eventInfoWidget() {
    var weekDay = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(event.datetimeLocal);
    var dateDay = DateFormat(DateFormat.ABBR_MONTH_DAY).format(event.datetimeLocal);
    return Container(
      //   height: height,
      // width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // color: Colors.red,
            //width: width * 0.56,
            //    width: width * 0.5,
            child: Text(
              event.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            event.venue.city,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 22,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * .02, 0, 0),
            child: Text(
              '${weekDay}',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * .07, 0, 0),
            //height added by yours truly
            height: height * .7,
            child: Text(
              event.description,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eventPosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width * .35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageUrl),
        ),
      ),
    );
  }
}
