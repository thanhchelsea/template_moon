part of template;

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({
    super.key,
    required this.children,
    required this.title,
  });
  final List<Widget> children;
  final List<String> title;

  @override
  State<TabContainerWidget> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainerWidget> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: widget.children.length,
      vsync: this,
    );
    tabController.index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabContainer(
      controller: tabController,
      // tabsStart: 0.2,
      // tabsEnd: 0.9,
      tabMaxLength: 100,
      // tabExtent: 80,

      borderRadius: BorderRadius.circular(10),
      tabBorderRadius: BorderRadius.circular(10),
      selectedTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      unselectedTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
      colors: [
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColor
        // Colors.blue,
      ],
      tabs: List.generate(
        widget.title.length,
        (index) {
          return Text(widget.title[index]);
        },
      ),
      children: List.generate(
        widget.children.length,
        (index) {
          return widget.children[index];
        },
      ),
    );
  }
}
