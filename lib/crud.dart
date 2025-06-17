// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
//
//
//
//
// class HiveData extends StatefulWidget {
//   const HiveData({Key? key}) : super(key: key);
//
//   @override
//   State<HiveData> createState() => _HiveDataState();
// }
//
// class _HiveDataState extends State<HiveData> {
//   TextEditingController taskController = TextEditingController();
//   TextEditingController subtitleController = TextEditingController();
//   late Box box;
//
//   @override
//   void initState() {
//     super.initState();
//     box = Hive.box("database");
//   }
//
//   // CREATE operation
//   Future<void> addData() async {
//     if (taskController.text.isNotEmpty && subtitleController.text.isNotEmpty) {
//       String key = DateTime.now().millisecondsSinceEpoch.toString();
//       await box.put(key, {
//         'task': taskController.text,
//         'subtitle': subtitleController.text,
//         'createdAt': DateTime.now().toString(),
//       });
//
//       taskController.clear();
//       subtitleController.clear();
//       setState(() {});
//       Navigator.pop(context);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Task added successfully!')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all fields!')),
//       );
//     }
//   }
//
//   // UPDATE operation
//   Future<void> updateData(String key, Map<String, dynamic> currentData) async {
//     taskController.text = currentData['task'];
//     subtitleController.text = currentData['subtitle'];
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             left: 16,
//             right: 16,
//             top: 16,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Update Task",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.indigo,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: taskController,
//                 decoration: const InputDecoration(
//                   labelText: 'Task',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: subtitleController,
//                 decoration: const InputDecoration(
//                   labelText: 'Subtitle',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey,
//                       ),
//                       child: const Text('Cancel'),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         if (taskController.text.isNotEmpty &&
//                             subtitleController.text.isNotEmpty) {
//                           await box.put(key, {
//                             'task': taskController.text,
//                             'subtitle': subtitleController.text,
//                             'createdAt': currentData['createdAt'],
//                             'updatedAt': DateTime.now().toString(),
//                           });
//
//                           taskController.clear();
//                           subtitleController.clear();
//                           setState(() {});
//                           Navigator.pop(context);
//
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Task updated successfully!')),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Please fill all fields!')),
//                           );
//                         }
//                       },
//                       child: const Text('Update'),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   // DELETE operation
//   Future<void> deleteData(String key) async {
//     await box.delete(key);
//     setState(() {});
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Task deleted successfully!')),
//     );
//   }
//
//   // Show delete confirmation dialog
//   void showDeleteDialog(String key, String taskName) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Task'),
//           content: Text('Are you sure you want to delete "$taskName"?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 deleteData(key);
//               },
//               style: TextButton.styleFrom(foregroundColor: Colors.red),
//               child: const Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Show add task modal
//   void showAddTaskModal() {
//     taskController.clear();
//     subtitleController.clear();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             left: 16,
//             right: 16,
//             top: 16,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Add New Task",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.indigo,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: taskController,
//                 decoration: const InputDecoration(
//                   labelText: 'Task',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: subtitleController,
//                 decoration: const InputDecoration(
//                   labelText: 'Subtitle',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: addData,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepOrange,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   child: const Text(
//                     'Add Task',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("CRUD Operations with Hive"),
//         backgroundColor: Colors.indigo,
//         foregroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: box.isEmpty
//             ? const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.note_add,
//                 size: 64,
//                 color: Colors.grey,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'No tasks yet!',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.grey,
//                 ),
//               ),
//               Text(
//                 'Tap the + button to add a new task',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         )
//             : ListView.builder(
//           padding: const EdgeInsets.all(8),
//           itemCount: box.length,
//           itemBuilder: (context, index) {
//             String key = box.keyAt(index).toString();
//             Map<String, dynamic> item = Map<String, dynamic>.from(box.get(key));
//
//             String task = item['task'] ?? '';
//             String subtitle = item['subtitle'] ?? '';
//
//             return Card(
//               elevation: 4,
//               margin: const EdgeInsets.symmetric(vertical: 4),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.indigo,
//                   child: Text(
//                     task.isNotEmpty ? task[0].toUpperCase() : 'T',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 title: Text(
//                   task,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(subtitle),
//                     if (item['createdAt'] != null)
//                       Text(
//                         'Created: ${DateTime.parse(item['createdAt']).toLocal().toString().split('.')[0]}',
//                         style: const TextStyle(
//                           fontSize: 10,
//                           color: Colors.grey,
//                         ),
//                       ),
//                   ],
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: () => updateData(key, item),
//                       icon: const Icon(Icons.edit, color: Colors.blue),
//                       tooltip: 'Edit',
//                     ),
//                     IconButton(
//                       onPressed: () => showDeleteDialog(key, task),
//                       icon: const Icon(Icons.delete, color: Colors.red),
//                       tooltip: 'Delete',
//                     ),
//                   ],
//                 ),
//                 isThreeLine: true,
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showAddTaskModal,
//         backgroundColor: Colors.deepOrange,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     taskController.dispose();
//     subtitleController.dispose();
//     super.dispose();
//   }
// }