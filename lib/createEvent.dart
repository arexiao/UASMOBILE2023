// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class createEvent extends StatefulWidget {
//   const createEvent({super.key});

//   @override
//   State<createEvent> createState() => _createEventState();
// }

// class _createEventState extends State<createEvent> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     content: Stack(
//                       overflow: Overflow.visible,
//                       children: <Widget>[
//                         Positioned(
//                           right: -40.0,
//                           top: -40.0,
//                           child: InkResponse(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: CircleAvatar(
//                               child: Icon(Icons.close),
//                               backgroundColor: Colors.red,
//                             ),
//                           ),
//                         ),
//                         Form(
//                           key: _formKey,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ElevatedButton(
//                                   child: Text("Submitß"),
//                                   onPressed: () {
//                                     if (_formKey.currentState.validate()) {
//                                       _formKey.currentState.save();
//                                     }
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           },
//           child: Text("Open Popup"),
//         ),
//       ),
//     );
//   }
// }

