// import 'package:assignment_4/constants/constants.dart';
// import 'package:assignment_4/models/notes_model.dart';
// import 'package:assignment_4/notes_provider/notes_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AddNoteScreen extends StatefulWidget {
//   const AddNoteScreen({super.key});

//   @override
//   State<AddNoteScreen> createState() => _AddNoteScreenState();
// }

// class _AddNoteScreenState extends State<AddNoteScreen> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios, color: whiteColor),
//         ),
//         actions: [
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: containerColor,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Icon(Icons.visibility, color: whiteColor),
//           ),
//           SizedBox(width: 10),
//           Consumer<NotesProvider>(
//             builder: (context, noteprovider, child) => GestureDetector(
//               onTap: () {
//                 final title = titleController.text.trim();
//                 final description = descriptionController.text.trim();

//                 if (title.isNotEmpty) {
//                   final updatedNote = NotesModel(
//                     title: title,
//                     description: description,
//                   );

//                   noteprovider.addNotes(updatedNote);
//                   Navigator.pop(context);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         'Title must be filled!!',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       backgroundColor: whiteColor,
//                     ),
//                   );
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: containerColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Icon(Icons.save, color: whiteColor),
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//         ],
//         centerTitle: false,
//         backgroundColor: Colors.transparent,
//       ),

//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(color: Colors.transparent),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     style: TextStyle(color: whiteColor, fontSize: 46),
//                     controller: titleController,
//                     cursorHeight: 38,
//                     cursorColor: whiteColor,
//                     decoration: InputDecoration(
//                       hintText: 'Title',
//                       hintStyle: TextStyle(color: Colors.grey, fontSize: 46),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),

//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(color: Colors.transparent),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     style: TextStyle(color: whiteColor, fontSize: 16),
//                     controller: descriptionController,
//                     cursorColor: whiteColor,

//                     decoration: InputDecoration(
//                       hintText: 'Type Something ......',
//                       hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/helper_functions/helper_function.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.visibility, color: whiteColor),
          ),
          SizedBox(width: 10),
          Consumer<NotesProvider>(
            builder: (context, noteprovider, child) => GestureDetector(
              onTap: () {
                final title = titleController.text.trim();

                if (title.isNotEmpty) {
                  showAddNoteConfirmationDialog(
                    context: context,
                    titleController: titleController,
                    descriptionController: descriptionController,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Title must be filled!!',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: whiteColor,
                    ),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.save, color: whiteColor),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: whiteColor, fontSize: 46),
                    controller: titleController,
                    cursorHeight: 38,
                    cursorColor: whiteColor,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 46),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: whiteColor, fontSize: 16),
                    controller: descriptionController,
                    cursorColor: whiteColor,
                    decoration: InputDecoration(
                      hintText: 'Type Something ......',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
