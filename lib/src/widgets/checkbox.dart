part of template;

enum CheckboxSize { large, medium, small }

class AppCheckbox extends StatefulWidget {
  /// Sets the size of the checkbox. It can be [CheckboxSize.large], [CheckboxSize.medium], or [CheckboxSize.small].
  final CheckboxSize? size;

  /// Sets a custom size for the checkbox. If provided, the [size] property will be ignored.
  final double? customSize;

  /// A callback that is called when the checkbox is tapped. It should update the state of the parent widget.
  final ValueChanged<bool> onChange;

  /// Sets the color of the checkbox when it's checked. By default, it is the primary color of the theme.
  final Color? activeColor;

  /// Sets the color of the checkbox when it's unchecked. By default, it is onBackground.withOpacity(0.12).
  final Color? inactiveColor;

  /// Sets the color of the checkbox border. By default, it is [Colors.black.withOpacity(0.12)].
  final Color? borderColor;

  /// The widget to display when the checkbox is checked. By default, it is an [Icon] with [Icons.check].
  final Widget? checkIcon;

  /// The widget to display when the checkbox is unchecked. By default, it is an empty [Container].
  final Widget? unCheckIcon;

  /// Whether the checkbox is checked. It should be updated by the [onChange] callback.
  final bool isChecked;

  /// Whether the checkbox is disabled. If it's true, the checkbox will be greyed out and the [onChange] callback won't be called.
  final bool disabled;

  /// The title of the checkbox. It is displayed next to the checkbox.
  final Widget? title;

  /// Whether the title is displayed on the left side of the checkbox. By default, it is displayed on the right side.
  final bool titleOnLeft;

  /// Whether the checkbox is disabled when tapped. If it's true, the checkbox will not change its state when tapped.
  final bool disabledTap;

  /// The border radius of the checkbox. By default, it is 4.0.
  final double? borderRadius;

  /// The margin of the checkbox. By default
  final EdgeInsets? margin;

  AppCheckbox({
    Key? key,
    this.size,
    this.customSize,
    required this.onChange,
    this.activeColor,
    this.inactiveColor,
    this.checkIcon,
    this.unCheckIcon,
    this.borderColor,
    required this.isChecked,
    this.disabled = false,
    this.title,
    this.titleOnLeft = true,
    this.disabledTap = false,
    this.borderRadius,
    this.margin,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppCheckboxState createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool isChecked;
  late double actualSize;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
    actualSize = _getActualSize();
  }

  double _getActualSize() {
    double size = 24; // default to medium if size is not provided
    if (widget.customSize != null) {
      size = widget.customSize!;
    } else {
      switch (widget.size) {
        case CheckboxSize.large:
          size = 32;
          break;
        case CheckboxSize.medium:
          size = 24;
          break;
        case CheckboxSize.small:
          size = 16;
          break;
        default:
          break;
      }
    }
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _onTap,
          child: Row(
            children: widget.titleOnLeft
                ? [
                    _buildCheckbox(),
                    if (widget.title != null) Flexible(child: _buildTitle())
                  ]
                : [
                    if (widget.title != null) Flexible(child: _buildTitle()),
                    _buildCheckbox()
                  ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (!widget.disabled && !widget.disabledTap) {
      setState(() {
        isChecked = !isChecked;
        widget.onChange(isChecked);
      });
    }
  }

  Widget _buildCheckbox() {
    return AnimatedContainer(
      height: actualSize,
      width: actualSize,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.0),
        color: _getCheckboxColor(),
        border: Border.all(
          color: widget.borderColor ??
              Theme.of(context).extension<ThemeColorExtension>()?.ksBorder ??
              Colors.black.withOpacity(0.12),
          width: 2,
        ),
      ),
      child: isChecked ? _buildCheckIcon() : _buildUnCheckIcon(),
    );
  }

  Color _getCheckboxColor() {
    if (widget.disabled) {
      return Theme.of(context).disabledColor.withOpacity(0.2);
    } else if (isChecked) {
      return widget.activeColor ?? Theme.of(context).colorScheme.primary;
    } else {
      return widget.inactiveColor ?? Colors.transparent;
    }
  }

  Widget _buildCheckIcon() {
    return widget.checkIcon ??
        Icon(
          Icons.check,
          color:
              widget.disabled ? Theme.of(context).disabledColor : Colors.white,
          size: actualSize * 0.8,
        );
    ;
  }

  Widget _buildUnCheckIcon() {
    return widget.unCheckIcon ?? Container();
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: widget.title!,
    );
  }
}
