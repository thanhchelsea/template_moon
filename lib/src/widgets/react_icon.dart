part of template;

class LikeButtonWithReactions extends StatefulWidget {
  @override
  _LikeButtonWithReactionsState createState() => _LikeButtonWithReactionsState();
}

class _LikeButtonWithReactionsState extends State<LikeButtonWithReactions> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      isHovered = true;
    });
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() {
      isHovered = false;
    });
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MouseRegion(
              onEnter: _onEnter,
              onExit: _onExit,
              child: Column(
                children: [
                  // Reactions bar (appears with animation when hovering)
                  AnimatedOpacity(
                    opacity: isHovered ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ReactionIcon(asset: '👍', label: 'Like', animationDuration: Duration(milliseconds: 100)),
                            ReactionIcon(asset: '❤️', label: 'Love', animationDuration: Duration(milliseconds: 100)),
                            ReactionIcon(asset: '😆', label: 'Haha', animationDuration: Duration(milliseconds: 100)),
                            ReactionIcon(asset: '😮', label: 'Wow', animationDuration: Duration(milliseconds: 100)),
                            ReactionIcon(asset: '😢', label: 'Sad', animationDuration: Duration(milliseconds: 100)),
                            ReactionIcon(asset: '😡', label: 'Angry', animationDuration: Duration(milliseconds: 100)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Like button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Thích',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 4),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Bình luận',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReactionIcon extends StatefulWidget {
  final String asset;
  final String label;
  final Duration animationDuration;

  const ReactionIcon({
    required this.asset,
    required this.label,
    required this.animationDuration,
  });

  @override
  _ReactionIconState createState() => _ReactionIconState();
}

class _ReactionIconState extends State<ReactionIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _onEnter(PointerEvent details) {
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              Text(
                widget.asset,
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
