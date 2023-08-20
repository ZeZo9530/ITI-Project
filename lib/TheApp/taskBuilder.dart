import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class taskBuilder extends StatelessWidget {
  final String taskName;
  final bool? taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  taskBuilder(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

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
                  value: taskCompleted,
                  activeColor: const Color.fromARGB(255, 19, 19, 19),
                  onChanged: onChanged
                  //  (value) {
                  //   setState(() {
                  //     taskCompleted = value;
                  //   });
                  // },
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
