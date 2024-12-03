// ignore_for_file: public_member_api_docs, sort_constructors_first
part of template;

class SidebarMoon extends StatefulWidget {
  // ignore: public_member_api_docs
  SidebarMoon({
    Key? key,
    required this.dio,
    required this.tagId,
    required this.projectName,
    this.getIconWithName,
    this.backgroundColor,
    this.onTreeReady,
    this.initRoute,
    this.avatar,
    this.fullnameUser,
    this.onChangeFeature,
    this.itemBuilder,
    this.onTapLogout,
    this.expandAll,
    this.isExpandedSideBar = true,
  }) : super(key: key);
  Dio dio;
  int tagId;
  String projectName;
  String? avatar;
  String? fullnameUser;
  Color? backgroundColor;
  bool? expandAll;
  bool isExpandedSideBar;

  ///hàm này trả về icon theo iconurl từ be trả về nhé ae
  Widget Function(String iconUrl)? getIconWithName;
  void Function(TreeNode<TreeNodeExt> item, BuildContext context)? onChangeFeature;
  void Function(TreeViewController<TreeNodeExt, TreeNode<TreeNodeExt>>)? onTreeReady;
  String? initRoute;
  Widget Function(
    BuildContext context,
    TreeNode<TreeNodeExt> item,
    bool isSelected,
  )? itemBuilder;

  Function? onTapLogout;
  @override
  State<SidebarMoon> createState() => _SidebarMoonState();
}

class _SidebarMoonState extends State<SidebarMoon> {
  late SideBarService _service;
  TreeViewController<TreeNodeExt, TreeNode<TreeNodeExt>>? treeViewController;
  //danh mục menu nhé ae
  TreeNode<TreeNodeExt> features = TreeNode.root();
  TreeNode<TreeNodeExt>? featureSelected;
  bool isExpandedSideBar = true;

//call api lay ra danh sach feature
  Future<BaseModel<List<FeatureMenuModel>>> getFeature() async {
    final data = await _service.getFeature(
      tagId: widget.tagId,
      projectName: widget.projectName,
    );
    final feat = buildTreeNodes(
      data.data ?? [],
    );
    setState(() {
      features.addAll(feat);
    });

    return data;
  }

  List<TreeNode<TreeNodeExt>> buildTreeNodes(
    List<FeatureMenuModel> menuItems, {
    String? parentPathRouter,
    TreeNode<TreeNodeExt>? parent,
  }) {
    var data = menuItems.map(
      (item) {
        Widget icon = Container();
        if (item.iconUrl?.contains('https://') ?? false) {
          icon = Image(image: NetworkImage(item.iconUrl!));
        } else {
          icon = widget.getIconWithName?.call(item.iconUrl ?? '') ?? Container();
        }
        final nodeData = TreeNodeExt(
          key: '${item.featureId}',
          name: item.featureName ?? '',
          pathRouter: item.route ?? '',
          parentPathRouter: parentPathRouter,
          parent: parent,
          icon: icon, // Icon(Icons.show_chart_sharp),
        );

        final treeNode = TreeNode<TreeNodeExt>(
          key: item.featureId?.toString() ?? 'unknown',
          data: nodeData,
        );
        if (widget.initRoute != null) {
          if (widget.initRoute!.contains(item.route ?? '')) {
            featureSelected = treeNode;
          }
          var subPaths = widget.initRoute!.split('/');
          if (subPaths.length > 2) {
            if ('${nodeData.parentPathRouter}/${nodeData.pathRouter}' == widget.initRoute!) {
              featureSelected = treeNode;
            }
          }
        }

        if (item.children != null && item.children!.isNotEmpty) {
          treeNode.addAll(
            buildTreeNodes(
              item.children!.cast<FeatureMenuModel>(),
              parentPathRouter: item.route,
              parent: treeNode,
            ),
          );
        }
        return treeNode;
      },
    ).toList();

    return data;
  }

  @override
  void initState() {
    isExpandedSideBar = widget.isExpandedSideBar;
    _service = SideBarService(widget.dio);

    getFeature();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SidebarMoon oldWidget) {
    if (oldWidget.isExpandedSideBar != widget.isExpandedSideBar) {
      setState(() {
        isExpandedSideBar = widget.isExpandedSideBar;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return sideBar();
  }

  Widget _renderUser() {
    return Container(
      alignment: Alignment.centerRight,
      // padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.avatar?.isNotEmpty ?? false)
            CircleAvatar(
              radius: 18,
              foregroundImage: NetworkImage(
                widget.avatar ?? '',
              ),
            )
          else
            const CircleAvatar(
              radius: 24,
              // foregroundImage: AssetImage(Assets.images.defaultAvatar.path),
            ),
          const Gap(10),
          SizedBox(
            child: Text(
              widget.fullnameUser ?? '',
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    // color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void initTreeViewContrl(
    TreeViewController<TreeNodeExt, TreeNode<TreeNodeExt>> controller,
    BuildContext context,
  ) {
    treeViewController = controller;
    if (widget.expandAll == true) {
      treeViewController?.expandAllChildren(features);
    }
    if (featureSelected != null) {
      if (featureSelected!.parent != null) treeViewController?.expandAllChildren(featureSelected!.data!.parent!);
      // else {
      //   treeViewController?.expandAllChildren(featureSelected!);
      // }
    }
  }

  Widget sideBar() {
    return AnimatedSwitcher(
      key: UniqueKey(),
      duration: const Duration(milliseconds: 3000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Container(
        width: isExpandedSideBar ? 250 : 40,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          border: isExpandedSideBar
              ? const Border(
                  right: BorderSide(
                    color: Color.fromARGB(31, 211, 211, 211),
                  ),
                )
              : null,
          boxShadow: isExpandedSideBar
              ? [
                  AppBoxShadow.ksSmallShadow(
                    color: const Color.fromARGB(31, 144, 144, 144),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            if (isExpandedSideBar) Container(padding: const EdgeInsets.all(16), child: _renderUser()),
            if (features.children.isNotEmpty && isExpandedSideBar)
              Expanded(
                child: TreeView.simple<TreeNodeExt>(
                  tree: features,
                  showRootNode: false,
                  indentation: const Indentation(width: 0),
                  expansionIndicatorBuilder: (context, node) {
                    return ChevronIndicator.rightDown(
                      alignment: Alignment.centerLeft,
                      tree: node,
                      color: Theme.of(context).primaryColor,
                      icon: Icons.arrow_right_rounded,
                    );
                  },
                  onTreeReady: (controller) {
                    //todo check router

                    initTreeViewContrl(controller, context);
                    widget.onTreeReady?.call(controller);
                  },
                  onItemTap: (item) {
                    setState(() {
                      featureSelected = item;
                    });
                    widget.onChangeFeature?.call(item, context);
                  },
                  builder: (context, node) {
                    final isSelected = node.data == featureSelected?.data;

                    // final isExpanded = node.isExpanded;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        // height: 42,
                        width: 250,
                        // color: node.level >= 2 || isExpanded
                        //     ? Color.fromARGB(255, 248, 250, 255)
                        //     : null,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: node.level >= 2 ? const EdgeInsets.only(left: 27) : EdgeInsets.zero,
                          child: widget.itemBuilder != null
                              ? widget.itemBuilder!.call(
                                  context,
                                  node,
                                  isSelected,
                                )
                              : Container(
                                  width: 250,
                                  height: 45, // The size dimension of the active button
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    gradient: isSelected
                                        ? node.isLeaf
                                            ? const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(255, 240, 244, 255),
                                                  Color.fromARGB(255, 207, 221, 255),
                                                ],
                                              )
                                            : null
                                        : null,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        50,
                                      ),
                                      bottomLeft: Radius.circular(
                                        50,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                    ),
                                    child: node.level >= 2
                                        ? Text(
                                            node.data?.name ?? '',
                                            style: TextStyle(
                                              color: isSelected ? Theme.of(context).primaryColor : null,
                                              fontWeight: isSelected ? FontWeight.w600 : null,
                                              fontSize: 13,
                                            ),
                                          )
                                        : Row(
                                            children: [
                                              if (node.data?.icon != null) node.data!.icon! else Container(),
                                              if (node.data?.icon != null)
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                              Text(
                                                node.data?.name ?? '',
                                                style: TextStyle(
                                                  color: isSelected ? Theme.of(context).primaryColor : null,
                                                  fontWeight: isSelected ? FontWeight.w600 : null,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isExpandedSideBar)
                  Expanded(
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          widget.onTapLogout?.call();
                        },
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            Gap(12),
                            Text(
                              'Đăng xuất',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpandedSideBar = !isExpandedSideBar;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: isExpandedSideBar ? 0 : 12),
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      isExpandedSideBar ? Icons.navigate_before : Icons.menu_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
