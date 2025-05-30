

import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  final String size;
  const AvailableSize({Key? key, required this.size}) : super(key: key);

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap:(){
      setState(() {
        isSelected = !isSelected;
      });
    },

    child: Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 40,
      height: 40,
      alignment:Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.red),
      ),
      child: Text(
        widget.size,
        style: const TextStyle(fontWeight: FontWeight.normal),
      ) ,
    ),
  );


}
