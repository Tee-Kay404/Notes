import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes/app/colors.dart';
import 'package:notes/widgets/dark_round_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filters = ['All', 'Important', 'To-do List'];

  late String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesColor.primaryLight,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/icons/conversation.png',
              height: 20.h,
              fit: BoxFit.scaleDown,
            ),
            Gap(10.h),
            Text(
              'Hello, there',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
        actions: [DarkRoundButton(icon: (Icons.menu_outlined))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // My Notes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Text(
              'MY\nNOTES',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1),
            ),
          ),
          Gap(20.h),
          // Filters
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(3, (index) {
                final filter = filters[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      side: BorderSide(color: NotesColor.brightGrey.shade100),
                    ),
                    backgroundColor: _selectedFilter == filter
                        ? NotesColor.notes
                        : Theme.of(context).primaryColorLight,
                    label: Text(filter),
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              shape: CircleBorder(),
              // mini: true,
              backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            SizedBox(width: 20.w), // Space between FABs
            FloatingActionButton(
              shape: CircleBorder(),
              // mini: true,
              backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {},
              child: Icon(
                Icons.mic_none_outlined,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
