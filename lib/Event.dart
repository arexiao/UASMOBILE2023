import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:progress1/component/EventListTile.dart';
import 'package:progress1/component/UpcomingEvent.dart';
import 'package:progress1/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Event extends StatefulWidget {
  const Event({super.key, eventPlanner});

  @override
  State<Event> createState() => _EventState();
}

class EventData {
  String title;
  String eventPlanner;
  String date;
  String time;
  String location;
  String content;
  String img;

  EventData(
    this.title,
    this.eventPlanner,
    this.date,
    this.time,
    this.location,
    this.content,
    this.img,
  );
}

class _EventState extends State<Event> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Menambahkan metode untuk mengambil data dari Firestore
  Future<List<EventData>> fetchEventDataFromFirestore() async {
    final eventsCollection = FirebaseFirestore.instance.collection('Events');
    final querySnapshot = await eventsCollection.get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return EventData(
        data['title'],
        data['eventPlanner'],
        data['date'],
        data['time'],
        data['location'],
        data['content'],
        data['img'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Event",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming Events",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder<List<EventData>>(
                future: fetchEventDataFromFirestore(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final eventDataList = snapshot.data;
                    return CarouselSlider.builder(
                      itemCount: eventDataList?.length,
                      itemBuilder: (context, index, id) =>
                          UPCEvent(eventDataList![index]),
                      options: CarouselOptions(
                        aspectRatio: 16 / 8,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "All Events",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              FutureBuilder<List<EventData>>(
                future: fetchEventDataFromFirestore(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final eventDataList = snapshot.data;
                    return Column(
                      children:
                          eventDataList!.map((e) => EventListTile(e)).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
