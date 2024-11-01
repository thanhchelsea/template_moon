part of template;

class QuantityInputWidget extends StatefulWidget {
  QuantityInputWidget({
    super.key,
    this.onChanged,
    this.controller,
    this.title,
    this.validator,
    this.enable,
  });
  Function(int)? onChanged;
  String? title;
  TextEditingController? controller;
  String? Function(String?)? validator;
  bool? enable;
  @override
  State<QuantityInputWidget> createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  late TextEditingController _controller;
  int currentValue = 0;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.controller == null) {
      _controller.text = '0';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      enable: widget.enable ?? true,
      title: widget.title,
      controller: _controller,
      borderColor: Colors.transparent,
      validator: (p) {
        return widget.validator?.call(p);
      },
      keyboardType: TextInputType.number,
      onChanged: (v) {
        if (v.isNotEmpty) {
          currentValue = int.parse(v);
        }
        widget.onChanged?.call(currentValue);
      },
      inputFormatters: <TextInputFormatter>[
        // Chỉ cho phép nhập số
        FilteringTextInputFormatter.digitsOnly,
      ],
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              currentValue++;
              _controller.text = currentValue.toString();
            },
            child: const Icon(
              Icons.arrow_drop_up_outlined,
              size: 16,
            ),
          ),
          InkWell(
            onTap: () {
              if (currentValue > 0) {
                currentValue--;
                _controller.text = currentValue.toString();
              }
            },
            child: const Icon(
              Icons.arrow_drop_down,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
