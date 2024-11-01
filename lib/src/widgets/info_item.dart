part of template;

class InfoItem extends StatelessWidget {
  InfoItem({
    super.key,
    this.title,
    required this.data,
    this.dataWidget,
    this.isVertical = true,
    this.colorText,
    this.fontSizeText,
    this.colorTitle,
    this.maxLine,
    this.dataStyle,
  });
  String? title;
  String data;
  TextStyle? dataStyle;
  Widget? dataWidget;
  bool isVertical;
  late TextTheme textTheme;
  double? fontSizeText;
  ThemeColorExtension? themeColor;
  Color? colorText;
  Color? colorTitle;
  int? maxLine;
  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    themeColor = Theme.of(context).extension<ThemeColorExtension>();
    if (!isVertical) {
      return Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: title!,
                style: textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontSize: fontSizeText ?? 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              dataWidget != null
                  ? WidgetSpan(child: dataWidget!)
                  : TextSpan(
                      text: data,
                      style: dataStyle ??
                          textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: colorText,
                              fontSize: fontSizeText ?? 13,
                              overflow: TextOverflow.ellipsis
                              // color: themeColor?.ksBody,
                              ),
                    ),
            ],
          ),
        ),
      );
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: textTheme.labelMedium?.copyWith(
                color: Colors.black,
                fontSize: fontSizeText ?? 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          const Gap(4),
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: dataWidget ??
                Text(
                  data,
                  maxLines: maxLine,
                  style: dataStyle ??
                      textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: colorText,
                          fontSize: fontSizeText ?? 13,
                          overflow: TextOverflow.ellipsis
                          // color: themeColor?.ksBody,
                          ),
                ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: textTheme.labelMedium?.copyWith(
              color: Colors.black,
              fontSize: fontSizeText ?? 13,
            ),
          ),
        const Gap(4),
        Container(
          // width: 200,
          child: dataWidget ??
              Text(
                data,
                maxLines: 1,
                style: dataStyle ??
                    textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                      color: colorText, fontSize: fontSizeText ?? 13,
                      // color: themeColor?.ksBody,
                    ),
              ),
        ),
      ],
    );
  }
}
