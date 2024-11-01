part of template;

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.dialogType,
    required this.content,
    this.note,
    // Optional parameters:
    required this.title,
    this.leftButtonTitle,
    this.rightButtonTitle,
    this.onLeftButtonClick,
    this.onRightButtonClick,
    this.customTitle,
    this.customContent,
    this.customNote,
    this.leftIconButton,
    this.rightIconButton,
    this.customAction,
    this.iconDialog,
    this.showLeftButton = true,
    this.showRightButton = true,
    this.showPopIcon = true,
    this.paddingAction,
    this.width,
  });

  final DialogType? dialogType;
  final String? title;
  final Widget? customTitle;
  final String? content;
  final Widget? customContent;
  final Widget? customNote;
  final String? note;
  final String? leftButtonTitle;
  final String? rightButtonTitle;
  final Widget? leftIconButton;
  final Widget? rightIconButton;
  final Function()? onLeftButtonClick;
  final Function()? onRightButtonClick;
  final Widget? customAction;
  final Widget? iconDialog;
  final EdgeInsetsGeometry? paddingAction;
  final bool showLeftButton;
  final double? width;
  final bool showPopIcon;
  final bool showRightButton;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<ThemeColorExtension>();
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      content: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 6, top: 6, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if (customTitle == null) Gap(14),
                      iconDialog ?? Container(),
                      if (showPopIcon) _buildPopIcon(context, themeColor),
                    ],
                  ),
                ),
                Align(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: customTitle == null ? 16 : 0,
                    ),
                    child: _buildDialogContent(context, themeColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopIcon(BuildContext context, ThemeColorExtension? themeColor) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.clear,
            size: 22,
            // color: themeColor?.iconColorDefault,
          ),
        ),
      ),
    );
  }

  // Widget getIconDialog(DialogType dialogType) {
  //   switch (dialogType) {
  //     case DialogType.info:
  //       return SvgPicture.asset(
  //         Assets.icons.icDialogInfo.path,
  //       );
  //     case DialogType.success:
  //       return SvgPicture.asset(
  //         Assets.icons.icDialogSuccess.path,
  //       );
  //     case DialogType.question:
  //       return Assets.icons.icDialogConfirm.svg();
  //     case DialogTypearning:
  //       return SvgPicture.asset(
  //         Assets.icons.icDialogWarning.path,
  //       );
  //     case DialogType.error:
  //       return SvgPicture.asset(
  //         Assets.icons.icDialogError.path,
  //       );
  //     case DialogType.confirm:
  //       return SvgPicture.asset(
  //         Assets.icons.icDialogConfirm.path,
  //       );
  //   }
  // }

  Color getDialogNoteColor(
      DialogType? dialogType, ThemeColorExtension? themeColor) {
    if (dialogType == null) return Colors.black;
    switch (dialogType) {
      case DialogType.info:
        return Color(0xff242628) ?? Colors.black;
      case DialogType.success:
      case DialogType.question:
        return Color(0xff242628) ?? Colors.black;
      case DialogType.error:
        return themeColor?.ksError ?? Colors.red;
      case DialogType.confirm:
        return Color(0xff242628) ?? Colors.black;
      case DialogType.warning:
        return themeColor?.ksWarning ?? Colors.black;
    }
  }

  Color getDialogConfirmButtonColor(
    DialogType dialogType,
    ThemeColorExtension? themeColor,
  ) {
    switch (dialogType) {
      case DialogType.info:
        return Color(0xff242628) ?? Colors.black;
      case DialogType.success:
      case DialogType.question:
        return Color(0xff242628) ?? Colors.black;
      case DialogType.error:
        return themeColor?.ksError ?? Colors.red;
      case DialogType.confirm:
        return Color(0xff242628) ?? Colors.black;
      case DialogType.warning:
        return themeColor?.ksWarning ?? Colors.black;
    }
  }

  Widget _buildDialogContent(
    BuildContext context,
    ThemeColorExtension? themeColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (customTitle == null) Gap(12),
        _buildTitle(context),
        Gap(8),
        _buildContent(context),
        if (note != null) Gap(6),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: _buildNote(context, themeColor),
            ),
          ],
        ),
        Gap(9),
        Padding(
          padding: paddingAction ?? const EdgeInsets.all(0),
          child: customAction ??
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (showLeftButton)
                    _buildDialogButton(
                      showBorder: false,
                      context: context,

                      title: leftButtonTitle ?? "Cancel",
                      backgroundColor: Colors.black12,
                      // width: 180,
                      // height: 40,
                      textColor: Color(0xff242628) ?? Colors.black,
                      onTap: onLeftButtonClick,
                      themeColor: themeColor,
                    ),
                  if (showLeftButton) SizedBox(width: 10),
                  if (showRightButton)
                    _buildDialogButton(
                      showBorder: false,
                      context: context,
                      // iconButton: rightIconButton ?? const Icon(Icons.check),
                      title: rightButtonTitle ?? "Confirm",
                      backgroundColor: themeColor?.ksPrimary ??
                          Theme.of(context).colorScheme.primary,
                      // width: 180,
                      // height: 40,
                      textColor: Colors.white,
                      onTap: onRightButtonClick,
                      themeColor: themeColor,
                    ),
                ],
              ),
        ),
        if (!showLeftButton && !showRightButton) Gap(12),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (customTitle != null) {
      return customTitle!;
    }
    return Text(
      title ?? '',
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (customContent != null) {
      return customContent!;
    }
    return Text(
      textAlign: TextAlign.center,
      content ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
          ),
    );
  }

  Widget _buildNote(BuildContext context, ThemeColorExtension? themeColor) {
    if (customNote != null) {
      return customNote!;
    }
    if (note == null) {
      return const SizedBox();
    }
    return Text(
      note ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: getDialogNoteColor(dialogType, themeColor),
          ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildDialogButton({
    required BuildContext context,
    required String title,
    Widget? iconButton,
    required Color backgroundColor,
    double? width,
    bool showBorder = true,
    required Color textColor,
    Function()? onTap,
    ThemeColorExtension? themeColor,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 2, 2, 10),
      child: SizedBox(
        width: width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: showBorder
                ? BorderSide(color: themeColor?.ksPrimary ?? Colors.red)
                : BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          onPressed: () {
            if (onTap != null) {
              onTap.call();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconButton ?? Container(),
              SizedBox(
                width: iconButton != null ? 8 : 0,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DialogType { info, success, warning, error, confirm, question }
