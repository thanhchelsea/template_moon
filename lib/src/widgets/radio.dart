part of template;

enum KSRadioType {
  basic,
  listTile,
}

enum KSShape { circle, square }

// ignore: must_be_immutable
class AppRadio<T> extends StatefulWidget {
  AppRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.size = 16,
    this.type = KSRadioType.basic,
    this.activeBgColor,
    this.inactiveBgColor,
    this.activeBorderColor,
    this.inactiveBorderColor,
    this.activeIcon,
    this.inactiveIcon,
    this.autofocus = false,
    this.focusNode,
    this.validator,
    this.shape = KSShape.circle,
    this.nameRadio,
    this.enable = true,
  }) : super(key: key);

  /// [type] : basic, listTile
  final KSRadioType type;

  /// [shape] : circle, square
  final KSShape? shape;

  ///kích thước của [shape]
  final double size;

  final Color? activeBgColor;

  final Color? inactiveBgColor;

  final Color? activeBorderColor;

  final Color? inactiveBorderColor;

  ///Hàm này được gọi khi user check hoặc uncheck nhé ace!
  final Function? onChanged;

  Widget? title;
  String? nameRadio;

  ///giá trị mặc định  activeIcon = const Icon(
  ///   Icons.check,
  ///   size: 20,
  /// )
  final Widget? activeIcon;

  final Widget? inactiveIcon;

  /// giá trị được set
  final T value;

  ///giá trị hiện tại đang được chọn
  final T groupValue;

  ///Xác thực đầu vào. Trả về một chuỗi lỗi, hiển thị nếu đầu vào không hợp lệ hoặc null
  final FormFieldValidator<T>? validator;

  final bool autofocus;

  /// an optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  bool enable;

  @override
  State<AppRadio> createState() => _AppRadioState();
}

class _AppRadioState<T> extends State<AppRadio<T>>
    with TickerProviderStateMixin {
  bool get enable => widget.onChanged != null;
  bool selected = false;
  Color get activeColor =>
      widget.activeBgColor ?? Theme.of(context).primaryColor;
  Color get inactiveColor => widget.inactiveBgColor ?? Colors.transparent;
  Color get activeBorderColor =>
      widget.activeBorderColor ?? Theme.of(context).primaryColor;
  Color get inactiveBorderColor =>
      widget.inactiveBorderColor ?? Theme.of(context).primaryColor;

  double _borderRadius() {
    return widget.shape == KSShape.circle ? 1000 : 12;
  }

  onSatusChange() {
    _handleChanged();
  }

  _handleChanged() {
    if (selected) return;
    widget.onChanged!(widget.value);
  }

  Widget _renderRadio() {
    if (widget.activeIcon != null && selected) {
      return widget.activeIcon!;
    }
    if (widget.inactiveIcon != null && !selected) {
      return widget.inactiveIcon!;
    }
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: selected
            ? (widget.enable
                ? activeColor
                : Theme.of(context).primaryColor.withOpacity(0.6))
            : inactiveColor,
        borderRadius: BorderRadius.circular(_borderRadius()),
        border: Border.all(
          color: selected ? activeBorderColor : inactiveBorderColor,
        ),
      ),
    );
  }

  Widget _renderTitle() {
    return widget.title ??
        Text(
          widget.nameRadio ?? "",
          style: Theme.of(context).textTheme.bodySmall,
        );
  }

  @override
  Widget build(BuildContext context) {
    selected = widget.value == widget.groupValue;
    return IgnorePointer(
      ignoring: !widget.enable,
      child: InkWell(
        borderRadius: BorderRadius.circular(_borderRadius()),
        enableFeedback: enable,
        onTap: () {
          onSatusChange();
          // state.didChange(widget.value);
        },
        child: Row(
          children: [
            _renderRadio(),
            if (widget.title != null || widget.nameRadio != null)
              const SizedBox(width: 6),
            _renderTitle(),
          ],
        ),
      ),
    );
  }
}
