part of template;

class StatusItem extends StatelessWidget {
  StatusItem({super.key, required this.isActive, required this.status});
  bool isActive;
  String status;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Theme.of(context).extension<ThemeColorExtension>()?.ksSuccess
                : Theme.of(context).extension<ThemeColorExtension>()?.ksError,
          ),
        ),
        Gap(4),
        Text(
          status,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isActive
                    ? Theme.of(context)
                        .extension<ThemeColorExtension>()
                        ?.ksSuccess
                    : Theme.of(context)
                        .extension<ThemeColorExtension>()
                        ?.ksError,
              ),
        ),
      ],
    );
  }
}
