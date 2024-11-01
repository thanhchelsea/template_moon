part of template;

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.labelText,
    required this.onPressed,
    this.backgroundColor, //= AppColors.colorPrimaryApp
    this.colorText = Colors.white,
    this.width,
    this.fontWeight = FontWeight.w600,
    this.fontSizeText,
    this.showShadow = true,
    this.padding,
    this.borderRadius,
    this.boxShadow,
    this.titleWidget,
    this.boxBorder,
    this.colorsGradient,
    this.gradientBorder,
  });
  List<Color>? colorsGradient;
  final double? width;
  final String labelText;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color colorText;
  final FontWeight fontWeight;
  final double? fontSizeText;
  final bool showShadow;
  final EdgeInsets? padding;
  final BoxShadow? boxShadow;
  final Widget? titleWidget;
  double? borderRadius;
  final Gradient? gradientBorder;
  BoxBorder? boxBorder;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: gradientBorder != null
          ? _GradientPainter(
              strokeWidth: 2,
              radius: borderRadius ?? 12,
              gradient: gradientBorder!,
            )
          : null,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: backgroundColor == null
              ? LinearGradient(
                  colors: colorsGradient ??
                      [
                        const Color(0xff7CA1FF),
                        const Color(0xff5566FF),
                      ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: backgroundColor,
          boxShadow: showShadow
              ? [
                  boxShadow ??
                      AppBoxShadow.ksMediumShadow(
                        color: const Color(0xffD5DBFF),
                      ),
                ]
              : [],
          border: boxBorder,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: padding != null ? Size.zero : null, // Set this
            padding: padding != null ? EdgeInsets.zero : null, // and this
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
          ),
          child: titleWidget ??
              Container(
                padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  labelText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSizeText ?? 12,
                    fontWeight: fontWeight,
                    color: colorText,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
  })  : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
