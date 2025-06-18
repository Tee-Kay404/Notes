import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes/app/colors.dart';

class ToDoListTile extends StatefulWidget {
  final String title;
  final bool ischecked;
  const ToDoListTile({super.key, required this.title, required this.ischecked});

  @override
  State<ToDoListTile> createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(style: BorderStyle.none),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: NotesColor.success, width: 2),
                color: isChecked ? NotesColor.success : Colors.transparent,
              ),
              child: isChecked
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ),
          Gap(20.h),
          Text(widget.title, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
