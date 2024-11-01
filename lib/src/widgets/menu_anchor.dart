part of template;

class MenuAnchorItem {
  Function? onTap;
  Widget? icon;
  String title;
  MenuAnchorItem({
    this.onTap,
    this.icon,
    required this.title,
  });
}

class MenuAnchorCustom extends StatelessWidget {
  MenuAnchorCustom({
    super.key,
    this.onTapDelete,
    this.onTapEdit,
    this.items = const [],
  });
  Function? onTapEdit;
  Function? onTapDelete;
  List<MenuAnchorItem> items;
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      // alignmentOffset: const Offset(-60, -30),
      builder: (
        BuildContext context,
        MenuController controller,
        Widget? child,
      ) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_vert_rounded,
            size: 16,
          ),
          // tooltip: 'Show menu',
        );
      },
      menuChildren: [
        if (onTapEdit != null)
          MenuItemButton(
            onPressed: () {
              onTapEdit?.call();
            },
            child: const Row(
              children: [
                Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
                Gap(8),
                Text(
                  'Sửa',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Gap(8),
              ],
            ),
          ),
        if (onTapDelete != null)
          MenuItemButton(
            onPressed: () {
              onTapDelete?.call();
            },
            child: const Row(
              children: [
                Icon(
                  Icons.delete,
                  size: 16,
                  color: Colors.white,
                ),
                Gap(8),
                Text(
                  'Xoá',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Gap(8),
              ],
            ),
          ),
        ...List.generate(
          items.length,
          (index) => MenuItemButton(
            onPressed: () {
              items[index].onTap?.call();
            },
            child: Row(
              children: [
                items[index].icon ?? Container(),
                const Gap(8),
                Text(
                  items[index].title,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const Gap(8),
              ],
            ),
          ),
        )
      ],
    );
  }
}
