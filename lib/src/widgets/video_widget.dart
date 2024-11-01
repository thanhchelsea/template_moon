part of template;

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
  });
  final String url;
  final double? width;
  final double? height;
  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController?.dispose(); // Giải phóng bộ nhớ video khi widget bị hủy

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) return Container();
    return Container(
      width: widget.width ?? 500,
      height: widget.height ?? 200,
      // color: Colors.red,
      child: FutureBuilder<void>(
        future: _initializeVideoPlayer(widget.url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Container(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _initializeVideoPlayer(String videoUrl) async {
    _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await _videoController!.initialize();

    // Tạo ChewieController với VideoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: _videoController!,
      aspectRatio: _videoController!.value.aspectRatio,
      autoPlay: false,
      looping: false,
      // Tùy chọn thêm cho điều khiển
      allowFullScreen: true, // Cho phép toàn màn hình
      allowMuting: true, // Cho phép tắt âm thanh
      autoInitialize: true, // Tự động khởi tạo
    );
    // setState(() {}); // Cập nhật giao diện sau khi video đã sẵn sàng
  }
}
