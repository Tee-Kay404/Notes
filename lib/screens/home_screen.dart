// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/app/colors.dart';
import 'package:notes/component/note_data.dart';
import 'package:notes/widgets/dark_round_button.dart';
import 'package:notes/widgets/glass_morphism.dart.dart';
import 'package:notes/widgets/note_card.dart';
import 'package:notes/widgets/to_do_list.dart';

class HomeScreen extends StatefulWidget {
  final List<NoteCard> notes;
  const HomeScreen({super.key, required this.notes});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filters = ['All(4)', 'Important', 'Bookmarked', 'To-do List'];
  List<String> todoList = [
    'Buy Groceries',
    'Finish my homework',
    'Pay the electric bills',
    'Practice my guitar',
    'Read all my books',
  ];

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
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  ),
                );
              },
            ),
          ),
          Gap(10.h),
          SizedBox(height: 320.h, child: NotesPage()),
          Gap(20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.sp),
            padding: EdgeInsets.all(15.sp),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFFFEE4E1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To-Do List',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.lora().fontFamily,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: todoList.length,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ToDoListTile(
                        title: todoList[index],
                        ischecked: false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GlassMorphism(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                shape: CircleBorder(),
                mini: true,
                backgroundColor: Theme.of(context).primaryColorDark,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              SizedBox(width: 5.w), // Space between FABs
              FloatingActionButton(
                mini: true,
                shape: CircleBorder(),
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
      ),
    );
  }
}
