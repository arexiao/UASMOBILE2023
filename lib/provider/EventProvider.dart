// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import '../Event.dart';

// class EventProvider with ChangeNotifier {
//   List<Event> _events = [];

//   List<Event> get events {
//     return [..._events];
//   }

//   Future<void> fetchEventsFromFirestore() async {
//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('events')
//           .where('status', isEqualTo: true)
//           .get();

//       final eventsData = querySnapshot.docs
//           .map((doc) => EventData(
//                 title: doc['title'],
//                 eventPlanner: doc['eventPlanner'],
//                 date: doc['date'].toDate(),
//                 time: doc['time'],
//                 location: doc['location'],
//                 content: doc['content'],
//                 img: doc['img'],
//               ))
//           .toList();

//       _events = eventsData;
//       notifyListeners();
//     } catch (error) {
//       // Handle error
//       print('Error fetching events: $error');
//     }
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// import '../Event.dart';

// class Events extends ChangeNotifier {
//   final Map<String, Event> _events = {};
//   final List<String> coba = [];
//   final docRef = FirebaseFirestore.instance.collection('events').withConverter(
//         fromFirestore: Event.fromFirestore,
//         toFirestore: (Event event, options) => event.toFirestore(),
//       );

//   Map<String, Event> get events => _events;

//   void initData() async {
//     final dataRef = await docRef.where('status', isEqualTo: true).get();
//     final data = dataRef.docs;
//     for (var docSnapshot in data) {
//       _events.putIfAbsent(docSnapshot.data().title, () => docSnapshot.data());
//     }
//     notifyListeners();
//   }
// }