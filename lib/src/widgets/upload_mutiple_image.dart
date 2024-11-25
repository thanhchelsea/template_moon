part of template;

class ImageFileUrlModel {
  final String? imageUrl;
  final Uint8List? imageFile;
  ImageFileUrlModel({
    this.imageFile,
    this.imageUrl,
  });
}

class ImageViewerDialog {
  /// Hàm hiển thị dialog
  static void show({
    required BuildContext context,
    String? imageUrl,
    Uint8List? imageData,
  }) {
    ImageProvider? imageProvider;

    if (imageData != null) {
      imageProvider = MemoryImage(imageData);
    } else if (imageUrl != null) {
      imageProvider = NetworkImage(imageUrl);
    }

    if (imageProvider == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Lỗi'),
          content: const Text('Không có ảnh để hiển thị.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          child: PhotoView(
            imageProvider: imageProvider,
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3.0,
            // enableRotation: true,
          ),
        ),
      ),
    );
  }
}

class UploadMutipleImage extends StatefulWidget {
  const UploadMutipleImage({
    super.key,
    this.width,
    this.height,
    this.constraints,
    this.dio,
    this.baseUrl,
    this.imagesOld = const [],
    this.selectedImage,
  });
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final List<ImageFileUrlModel> imagesOld;
  final Function(List<ImageFileUrlModel> images)? selectedImage;
  final Dio? dio;
  final String? baseUrl;
  @override
  State<UploadMutipleImage> createState() => _UploadMutipleImageState();
}

class _UploadMutipleImageState extends State<UploadMutipleImage> {
  List<ImageFileUrlModel> images = [];
  @override
  void initState() {
    images = List.from(widget.imagesOld);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void removeImage(ImageFileUrlModel image) {
    setState(() {
      images.removeWhere((element) => element == image);
      widget.selectedImage?.call(images);
    });
  }

  void uploadImage(Uint8List s) async {
    if (widget.dio != null) {
      var response = await AdvertUsecase(FeatRepoImpl(FeatService(
        widget.dio!,
        baseUrl: widget.baseUrl,
      ))).uploadImage(
        images: s,
      );
      if (response.data?.filePath != '') {
        setState(() {
          images.add(ImageFileUrlModel(imageUrl: response.data?.filePath));
          widget.selectedImage?.call(images);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          AppBoxShadow.ksSmallShadow(),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (images.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ImageViewerDialog.show(
                        context: context,
                        imageUrl: images[index].imageUrl,
                        imageData: images[index].imageFile,
                      );
                    },
                    child: ShowImageFormImageNote(
                      image: images[index],
                      onClose: () {
                        removeImage(
                          images[index],
                        );
                      },
                    ),
                  );
                },
                itemCount: images.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(10);
                },
              ),
            ),
          DottedBorder(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 202, 215, 248),
            radius: const Radius.circular(100),
            dashPattern: const [5, 5],
            strokeCap: StrokeCap.round,
            child: UploadImageWidget(
              getImageByte: (s) {
                uploadImage(s);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShowImageFormImageNote extends StatelessWidget {
  const ShowImageFormImageNote({
    super.key,
    required this.image,
    required this.onClose,
  });
  final ImageFileUrlModel image;
  final Function onClose;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: image.imageFile != null
                  ? DecorationImage(
                      image: MemoryImage(image.imageFile!),
                      fit: BoxFit.cover, // Adjust the image fit
                    )
                  : DecorationImage(
                      image: NetworkImage(image.imageUrl!),
                      fit: BoxFit.cover, // Adjust the image fit
                    ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CloseButton(
              onPressed: () {
                onClose();
              },
              color: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }
}
