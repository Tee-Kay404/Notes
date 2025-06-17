import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkRoundButton extends StatelessWidget {
  final IconData icon;
  const DarkRoundButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, size: 20.sp)),
    );
  }
}
