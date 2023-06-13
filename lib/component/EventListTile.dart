import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:progress1/Event.dart';

class EventListTile extends StatefulWidget {
  EventListTile(this.data,{super.key});
  EventData data;

  @override
  State<EventListTile> createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(12.0),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.orangeAccent, 
        borderRadius: BorderRadius.circular(26.0)
      ),
      child: Row(
        children: [
          Flexible(child: Container(
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(widget.data.img!),
                fit: BoxFit.fitHeight,
              )
            ),
          )),
          SizedBox(
            width:10.0,
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Text(
                  widget.data.title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(widget.data.eventPlanner!,
                maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(widget.data.date!+"                              "+widget.data.time!,
                maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(widget.data.content!,
                maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text("Lokasi: "+ widget.data.location!,
                maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
