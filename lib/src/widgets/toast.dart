// ignore: use_string_in_part_of_directives
part of template;

///
enum ToastType { success, error, warning, info }

enum ToastWidth { short, medium, long, full }

class PackageColors {
  PackageColors._();

  /// --------------------- TOAST COLOR ---------------------
  static const Color textInfo = Color(0xff066BF9);
  static const Color info30 = Color(0xff3388FF);
  static const Color success30 = Color(0xff3CB43C);
  static const Color warning30 = Color(0xffF5C400);
  static const Color error30 = Color(0xffFF3948);
  static const Color lineNeutral70 = Color(0xffEAEBEC);
}

///
class BaseToast extends StatelessWidget {
  const BaseToast(
      {required this.toastType,
      required this.message,
      this.buttonTitle,
      super.key,
      this.onActionButtonClick,
      this.onTrailingClick,
      this.toastHeight,
      this.toastWidth,
      this.isHasAction = false,
      this.isHasTrailing = false});

  final ToastType toastType;
  final String message;
  final String? buttonTitle;
  final Function()? onActionButtonClick;
  final Function(BuildContext context)? onTrailingClick;
  final bool isHasAction;
  final bool isHasTrailing;
  final double? toastHeight;
  final double? toastWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: toastWidth,
      height: toastHeight ?? 52,
      decoration: BoxDecoration(
        color: const Color(0xffF4F5F5),
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3d868b92),
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
          BoxShadow(
            color: Color(0x286d7178),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLeading(),
          _buildMessage(context),
          _buildActionButton(context),
          _buildTrailing(context),
        ],
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    if (isHasTrailing) {
      return GestureDetector(
        onTap: () => onTrailingClick?.call(context),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
            color: Color(0xffF4F5F5),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SvgPicture.asset(
            Assets.icons.icClear.path,
            package: packageName,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Container _buildLeading() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
        color: getLeadingColor(toastType),
      ),
      margin: const EdgeInsets.only(right: 12),
      width: 48,
      padding: const EdgeInsets.all(14),
      child: getLeadingIcon(toastType),
    );
  }

  Color getLeadingColor(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return PackageColors.success30;
      case ToastType.error:
        return PackageColors.error30;
      case ToastType.warning:
        return PackageColors.warning30;
      case ToastType.info:
        return PackageColors.info30;
    }
  }

  Widget getLeadingIcon(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return Assets.icons.icCheck.svg(
          package: packageName,
        );
      case ToastType.error:
        return Assets.icons.icWarning.svg(
          package: packageName,
        );
      case ToastType.warning:
        return Assets.icons.icInfo.svg(
          package: packageName,
        );
      case ToastType.info:
        return Assets.icons.icInfo.svg(
          package: packageName,
        );
    }
  }

  Widget _buildMessage(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    if (isHasAction) {
      return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: TextButton(
            onPressed: onActionButtonClick,
            child: Center(
              child: Text(
                buttonTitle ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: PackageColors.textInfo, fontWeight: FontWeight.w500),
              ),
            )),
      );
    }
    return Container();
  }
}
