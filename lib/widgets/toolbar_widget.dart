import 'package:flutter/material.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: Text("4 todos")),
        Tooltip(
          message: "all todos",
          child: TextButton(onPressed: () {
            
          }, child: const Text("All")),
        ),
        Tooltip(
          message: "Active",
          child: TextButton(onPressed: () {
            
          }, child: const Text("Active")),
        ),
        Tooltip(
          message: "Completed",
          child: TextButton(onPressed: () {
            
          }, child: const Text("Completed")),
        ),
      ],
    );
  }
}