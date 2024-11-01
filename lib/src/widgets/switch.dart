part of template;

// ignore: must_be_immutable
class AppSwitch extends StatefulWidget {
  /// Creates a custom design switch.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onToggle] is called when the user toggles the switch on or off.
  ///
  AppSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
    this.activeColor,
    this.inactiveColor,
    this.width,
    this.height,
    this.toggleSize,
    this.borderRadius,
    this.activeIcon,
    this.inactiveIcon,
    this.disabled = false,
  }) : super(key: key);

  /// Determines if the switch is on or off.
  ///
  /// This property is required.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// This property is required.
  ///
  final ValueChanged<bool> onToggle;

  /// The color to use on the switch when the switch is on.
  ///
  /// Defaults to [ColorScheme.primary].
  Color? activeColor;

  /// The color to use on the switch when the switch is off.
  ///
  /// Defaults to [ColorScheme.background].
  Color? inactiveColor;

  /// The given width of the switch.
  ///
  /// Defaults to a width of 48
  double? width;

  /// The given height of the switch.
  ///
  /// Defaults to a height of 24
  double? height;

  /// The size of the toggle of the switch.
  ///
  /// Defaults to a size of 20
  double? toggleSize;

  /// The border radius of the switch.
  final double? borderRadius;

  /// The icon inside the toggle when the given value is true.
  /// activeIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? activeIcon;

  /// The icon inside the toggle when the given value is false.
  /// inactiveIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? inactiveIcon;

  /// Determines whether the switch is disabled.
  ///
  /// Defaults to the value of false.
  final bool disabled;

  @override
  _AppSwitchState createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animateSwitch(widget.value);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AppSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _animateSwitch(widget.value);
    }
  }

  void _animateSwitch(bool value) {
    value ? _animationController.forward() : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: _onTap,
          child: _buildSwitch(),
        );
      },
    );
  }

  void _onTap() {
    if (!widget.disabled) {
      _animateSwitch(!widget.value);
      widget.onToggle(!widget.value);
    }
  }

  Widget _buildSwitch() {
    return Opacity(
      opacity: widget.disabled ? 0.6 : 1,
      child: Container(
        width: widget.width ?? 48,
        height: widget.height ?? 24,
        decoration: _buildDecoration(),
        child: _buildToggle(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.borderRadius ?? 360)),
      boxShadow: _buildBoxShadows(),
      border: _buildBorder(),
    );
  }

  List<BoxShadow> _buildBoxShadows() {
    return [
      const BoxShadow(
        color: Color(0xffe0dadb),
      ),
      BoxShadow(
        color: widget.value
            ? widget.activeColor ?? Theme.of(context).colorScheme.primary
            : widget.inactiveColor ?? Theme.of(context).colorScheme.background,
        blurRadius: (widget.value ? 0 : 1),
        offset: Offset(0, widget.value ? 0 : 2),
      ),
    ];
  }

  Border _buildBorder() {
    return Border.all(
      width: 0.1,
    );
  }

  Widget _buildToggle() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        child: _buildToggleContent(),
      ),
    );
  }

  Widget _buildToggleContent() {
    return Container(
      width: widget.toggleSize ?? 20,
      height: widget.toggleSize ?? 20,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [AppBoxShadow.ksSmallShadow(color: const Color(0x1E000000))],
      ),
      child: _buildIcons(),
    );
  }

  Widget _buildIcons() {
    return FittedBox(
      fit: BoxFit.contain,
      child: Stack(
        children: [
          _buildIcon(widget.activeIcon, widget.value),
          _buildIcon(widget.inactiveIcon, !widget.value),
        ],
      ),
    );
  }

  Widget _buildIcon(Widget? icon, bool isVisible) {
    return Center(
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: icon,
      ),
    );
  }
}
