import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:progress1/Event.dart';

class UPCEvent extends StatefulWidget {
  UPCEvent(this.data, {super.key});
  EventData data;
  @override
  State<UPCEvent> createState() => _UPCEventState();
}

class _UPCEventState extends State<UPCEvent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.data.img!),
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.orange.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0,),
            Text(widget.data.date!, 
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            )
          ],
        ),
      ),
    );
  }
}
