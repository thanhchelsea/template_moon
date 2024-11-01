part of template;

class TextFieldUrlOrUploadImage extends StatefulWidget {
  TextFieldUrlOrUploadImage({
    super.key,
    this.controller,
    this.hintText,
    this.title,
    this.validator,
    this.width,
    this.height,
    this.constraints,
    required this.uploadImage,
  });
  TextEditingController? controller;
  String? hintText;
  String? title;
  String? Function(String?)? validator;
  double? width;
  double? height;
  BoxConstraints? constraints;
  Future<String?> Function(Uint8List s) uploadImage;
  @override
  State<TextFieldUrlOrUploadImage> createState() =>
      _TextFieldUrlOrUploadImageState();
}

class _TextFieldUrlOrUploadImageState extends State<TextFieldUrlOrUploadImage> {
  // final AdvertUsecase _advertUsecase = Injector.instance();
  late TextEditingController controller;
  String urlImage = '';
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.addListener(
          () {
            if (mounted) urlImage = controller.text.trim();
          },
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // controller.dispose();
    controller.removeListener(
      () {},
    );
    super.dispose();
  }

  void uploadImage(Uint8List s) async {
    // var response = await _advertUsecase.uploadImage(images: s);
    String? imagePath = await widget.uploadImage?.call(s);
    // print("link anh ${response.data?.toJson()}");
    if (imagePath != null) {
      setState(() {
        controller.text = imagePath;
        urlImage = imagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          AppBoxShadow.ksSmallShadow(),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DottedBorder(
            padding: EdgeInsets.all(8),
            color: const Color.fromARGB(255, 202, 215, 248),
            radius: Radius.circular(100),
            dashPattern: [5, 5],
            strokeCap: StrokeCap.round,
            child: urlImage.isNotEmpty
                ? Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ImagePreviewWidget(
                          imageUrl: urlImage,
                          constraints: widget.constraints,
                          width: widget.width,
                          height: widget.height,
                          // width: 100,
                          // height: 50,
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              urlImage = '';
                              controller.clear();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : UploadImageWidget(
                    getImageByte: (s) {
                      uploadImage(s);
                    },
                  ),
          ),
          const Gap(12),
          AppTextField(
            isRequired: false,
            controller: controller,
            hintText: widget.hintText,
            backgroundColor: Colors.white,
            borderColor: Colors.black12, showShadow: false,
            // title: widget.title,
            onChanged: (v) {
              setState(() {
                urlImage = v;
              });
            },
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
