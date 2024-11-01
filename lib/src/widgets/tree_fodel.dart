part of template;

class TreeFodel<U extends Object> extends StatefulWidget {
  TreeFodel({
    super.key,
    required this.entitys,
    this.isShowVerticalProduct = true,
    this.widgetImage = 80,
    this.products = const [],
    this.onTapEntity,
    this.fodelBottomAction,
    required this.renderItemFodel,
    this.iconFodel,
    this.renderHeaderRigthContent,
    this.topLeftWidgetProduct,
    this.fodelTopAction,
    this.renderIcon,
    this.hoverActionIconFodel,
    this.objects,
    this.renderObjectItem,
    this.childrenProvider,
    this.decorationListProduct,
    this.titleListProducts,
    this.paddingListProduct,
    this.constraints,
  });
  List<U> entitys;
  bool isShowVerticalProduct;
  double widgetImage;
  List<dynamic> products;
  List<dynamic>? objects;
  Widget Function(dynamic object, int index)? renderObjectItem;
  Iterable<dynamic> Function(dynamic)?
      childrenProvider; // Đảm bảo trả về Iterable<U>
  Function? onTapEntity;
  Widget? fodelBottomAction;
  Widget? fodelTopAction;
  Widget Function(dynamic entity, bool? isHelight)? renderItemFodel;
  Widget? iconFodel;
  Widget? renderHeaderRigthContent;
  Widget Function(dynamic)? topLeftWidgetProduct;
  Widget Function(dynamic)? hoverActionIconFodel;
  Decoration? decorationListProduct;
  Widget Function(dynamic entity, bool? isHelight)? renderIcon;
  Widget? titleListProducts;
  EdgeInsets? paddingListProduct;
  BoxConstraints? constraints;
  @override
  State<TreeFodel> createState() => _TreeFodelState<U>();
}

class _TreeFodelState<U extends Object> extends State<TreeFodel> {
  ThemeColorExtension? themeColorExt;
  List<U> data = [];
  late final TreeController<U> treeController;

  void initController() {
    // (CategoryEntity node) => node.listChild ?? [],
    treeController = TreeController<U>(
      roots: widget.entitys.cast<U>(),
      childrenProvider: (U node) {
        Iterable<U> data = widget.childrenProvider!(node) as Iterable<U>;
        return data;
      },
      // Đảm bảo trả về Iterable<U>
    );
  }

  @override
  void initState() {
    initController();
    // Future.delayed(
    //   const Duration(milliseconds: 300),
    //   () {
    //     data = widget.entitys as List<U>;
    //     if (widget.entitys.isNotEmpty) {
    //       treeController.toggleExpansion(data[0]);
    //       setState(() {
    //         selected = data.first;
    //         treeEntrySelected = TreeEntry<U>(
    //           parent: null,
    //           node: data.first,
    //           index: 0,
    //           level: 0,
    //           isExpanded: true,
    //           hasChildren:
    //               false, // widget.entitys.first.listChild?.isNotEmpty ?? false,
    //         );
    //       });
    //       widget.onTapEntity?.call(widget.entitys.first);
    //     }
    //   },
    // );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TreeFodel oldWidget) {
    if (oldWidget.entitys != widget.entitys) {
      data = widget.entitys as List<U>;
      treeController.roots = data;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }

  TreeEntry<U>? treeEntrySelected;
  U? selected;
  @override
  Widget build(BuildContext context) {
    themeColorExt = Theme.of(context).extension();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              if (selected != null) {
                widget.onTapEntity?.call(null);
                treeController.collapse(selected!);
                setState(() {
                  selected = null;
                  treeEntrySelected = null;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              decoration: BoxDecoration(
                color: themeColorExt?.ksPrimary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.fodelTopAction != null) widget.fodelTopAction!,
                  // if (widget.fodelTopAction != null) const Gap(12),
                  Expanded(
                    child: AnimatedTreeView<U>(
                      treeController: treeController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      nodeBuilder: (
                        BuildContext context,
                        TreeEntry<U> entry,
                      ) {
                        return Column(
                          children: [
                            const Gap(6),
                            MyTreeTile(
                              // icon: widget.iconFodel,
                              renderIcon: widget.renderIcon,
                              renderItemFodel: widget.renderItemFodel,
                              key: ValueKey(entry.node),
                              entry: entry,
                              isHelight: selected == entry.node,
                              onTap: () {
                                if (entry.node == selected) {
                                  widget.onTapEntity?.call(null);
                                  treeController.collapse(entry.node);
                                  setState(() {
                                    selected = null;
                                    treeEntrySelected = null;
                                  });
                                } else {
                                  widget.onTapEntity?.call(entry.node);
                                  treeController.toggleExpansion(entry.node);
                                  setState(() {
                                    selected = entry.node;
                                    treeEntrySelected = entry;
                                  });
                                }
                              },
                              hoverActionIconFodel: widget.hoverActionIconFodel,
                            ),
                            const Gap(6),
                          ],
                        );
                      },
                    ),
                  ),
                  if (widget.fodelBottomAction != null)
                    widget.fodelBottomAction!,
                ],
              ),
            ),
          ),
        ), //
        Expanded(
          flex: 9,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,

              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              // decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.renderHeaderRigthContent ?? Container(),
                  const Gap(6),
                  if (widget.products.isNotEmpty ||
                      (widget.objects?.isNotEmpty ?? false))
                    Container(
                      width: double.infinity,
                      padding: widget.paddingListProduct,
                      decoration: widget.decorationListProduct,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.titleListProducts ?? Container(),
                          Container(
                            width: double.infinity,
                            child: Wrap(
                              children: List.generate(
                                widget.objects != null
                                    ? widget.objects!.length
                                    : widget.products.length,
                                (index) {
                                  return Container(
                                    constraints: widget.constraints,
                                    child: MouseRegion(
                                      onEnter: (PointerEnterEvent event) {
                                        _onHoverChanged(index: index);
                                      },
                                      onExit: (PointerExitEvent event) {
                                        _onHoverChanged(index: -1);
                                      },
                                      child: Stack(
                                        children: [
                                          widget.renderObjectItem?.call(
                                                  widget.objects?[index],
                                                  index) ??
                                              Text(
                                                  "them ham custom render data"),
                                          if (_isHovered == index &&
                                              widget.topLeftWidgetProduct !=
                                                  null)
                                            Positioned(
                                              left: 2,
                                              top: 2,
                                              child: widget
                                                  .topLeftWidgetProduct!
                                                  .call(widget.objects != null
                                                      ? widget.objects![index]
                                                      : widget.products[index]),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Center(
                      child: Text('Danh sách trống'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  int _isHovered = -1;
  void _onHoverChanged({required int index}) {
    if (index == _isHovered) return;
    setState(() {
      _isHovered = index;
    });
  }
}

class MyTreeTile<U extends Object> extends StatefulWidget {
  MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
    this.isHelight = false,
    required this.renderItemFodel,
    this.renderIcon,
    this.hoverActionIconFodel,
  });
  Widget Function(dynamic entity, bool? isHelight)? renderItemFodel;
  Widget Function(dynamic entity, bool? isHelight)? renderIcon;
  Widget Function(dynamic)? hoverActionIconFodel;
  final TreeEntry<U> entry;
  final VoidCallback onTap;
  bool isHelight;
  @override
  State<MyTreeTile> createState() => _MyTreeTileState();
}

class _MyTreeTileState extends State<MyTreeTile> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) {
        _onHoverChanged(enabled: true);
      },
      onExit: (PointerExitEvent event) {
        _onHoverChanged(enabled: false);
      },
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: InkWell(
              onTap: widget.onTap,
              child: TreeIndentation(
                entry: widget.entry,
                guide: const IndentGuide.connectingLines(indent: 20),
                child: Row(
                  children: [
                    widget.renderIcon
                            ?.call(widget.entry.node, widget.isHelight) ??
                        FolderButton(
                          iconSize: 18,
                          disabledColor:
                              widget.isHelight ? Colors.redAccent : null,
                          isOpen: widget.entry.hasChildren
                              ? widget.entry.isExpanded
                              : null,
                          onPressed:
                              widget.entry.hasChildren ? widget.onTap : null,
                          // icon: icon,
                          color: widget.isHelight
                              ? Colors.redAccent
                              : Theme.of(context)
                                  .extension<ThemeColorExtension>()
                                  ?.ksPrimary,
                        ),
                    const Gap(4),
                    Expanded(
                      flex: 8,
                      child: widget.renderItemFodel != null
                          ? widget.renderItemFodel!(
                              widget.entry.node,
                              widget.isHelight,
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // if (widget.hoverActionIconFodel != null) const Gap(4),
                if (widget.hoverActionIconFodel != null)
                  Expanded(
                    child: _isHovered
                        ? widget.hoverActionIconFodel!.call(widget.entry.node)
                        : Container(),
                  )
                else
                  Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isHovered = false;

  void _onHoverChanged({required bool enabled}) {
    if (enabled == _isHovered) return;
    setState(() {
      _isHovered = enabled;
    });
  }
}
