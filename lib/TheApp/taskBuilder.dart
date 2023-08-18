import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class taskBuilder extends StatefulWidget {
  taskBuilder(
      {super.key, required this.taskName, required this.deleteFunction});
  final String taskName;
  final Function(BuildContext)? deleteFunction;
  @override
  State<taskBuilder> createState() =>
      _taskBuilder(taskName: taskName, deleteFunction: deleteFunction);
}

bool? isChecked = false;

class _taskBuilder extends State<taskBuilder> {
  _taskBuilder({required this.taskName, required this.deleteFunction});
  String taskName;
  Function(BuildContext)? deleteFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.deepPurple,
          )
        ]),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                activeColor: const Color.fromARGB(255, 19, 19, 19),
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Expanded(
                child: Text(
                  taskName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
