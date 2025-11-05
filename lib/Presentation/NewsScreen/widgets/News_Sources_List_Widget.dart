import 'package:flutter/material.dart';
import '../../../API/model/responses/sources/Source.dart';
import '../News_List_View.dart';

class NewsSourcesListWidget extends StatefulWidget {
  List<Source> tabs;

  NewsSourcesListWidget(this.tabs, {super.key});

  @override
  State<NewsSourcesListWidget> createState() => _NewsSourcesListWidgetState();
}

class _NewsSourcesListWidgetState extends State<NewsSourcesListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            unselectedLabelStyle: TextStyle(fontSize: 15),
            labelStyle: TextStyle(fontSize: 18),
            tabs: widget.tabs.map((source) => Tab(text: source.name)).toList(),
          ),
          const SizedBox(height: 20),
          Expanded(child: NewsListView(source: widget.tabs[selectedIndex])),
        ],
      ),
    );
  }
}
