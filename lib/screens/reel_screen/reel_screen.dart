import 'package:flutter/material.dart';
import 'package:foodie/customWidgets/custom_text.dart';
import 'package:video_player/video_player.dart';
import 'package:foodie/customWidgets/custom_app_bar.dart';
import 'package:foodie/customWidgets/app_button.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/sizer.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  late PageController _pageController;
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  final reels = [
    'assets/vedios/reel_vedio_1.mp4',
    'assets/vedios/reel_vedio_1.mp4',
    'assets/vedios/reel_vedio_1.mp4',
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadVideo(0);
  }

  Future<void> _loadVideo(int index) async {
    _isInitialized = false;
    setState(() {});

    await _controller?.pause();
    await _controller?.dispose();

    final controller = VideoPlayerController.asset(reels[index]);
    await controller.initialize();
    controller.setLooping(true);
    await controller.play();

    _controller = controller;

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  void _onPageChanged(int index) {
    currentIndex = index;
    _loadVideo(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              /// 🎥 Video Background
              Positioned.fill(
                child: _isInitialized && _controller != null
                    ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller!.value.size.width,
                    height: _controller!.value.size.height,
                    child: VideoPlayer(_controller!),
                  ),
                )
                    : const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFF7622),
                  ),
                ),
              ),

              /// 🌑 Overlay
              Positioned.fill(
                child: Container(color: Colors.black.withOpacity(0.15)),
              ),

              /// 🔝 AppBar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomAppBar(
                  title: "Reel",
                  centerTitle: true,
                  showBack: true,
                  backgroundColor: Colors.transparent,
                  titleColor: Colors.white,
                  iconColor: Colors.white,
                  prefixBgColor: const Color(0xFFECF0F4),
                  suffixBgColor: Colors.black,
                  suffix: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                  colorShowBack: AppColors.black,
                  suffixBadgeCount: 2,
                  onSuffixTap: () {
                    debugPrint("Bag tapped");
                  },
                ),
              ),

              /// ▶ Play / Pause Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller!.value.isPlaying) {
                        _controller!.pause();
                      } else {
                        _controller!.play();
                      }
                    });
                  },
                  child: AnimatedOpacity(
                    opacity: _controller?.value.isPlaying == true ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: sizer.setWidth(47),
                      height: sizer.setWidth(47),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: sizer.setWidth(29),
                      ),
                    ),
                  ),
                ),
              ),

              /// ❤️ 📤 🛍 Right Side Icons
              Positioned(
                right: sizer.setWidth(20),
                top: sizer.setHeight(450),
                child: Column(
                  children: [
                    _iconCircle(Icons.favorite_border, sizer),
                    SizedBox(height: sizer.setHeight(14)),
                    _iconCircle(Icons.share, sizer),
                    SizedBox(height: sizer.setHeight(14)),
                    _iconCircle(Icons.shopping_bag_outlined, sizer),
                  ],
                ),
              ),

              /// 🍽 Bottom Info + Button
              Positioned(
                left: sizer.setWidth(20),
                right: sizer.setWidth(20),
                bottom: sizer.setHeight(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Restaurant Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: sizer.setWidth(18),
                          backgroundImage: const AssetImage(
                            "assets/images/png/hotel.png",
                          ),
                        ),
                        SizedBox(width: sizer.setWidth(10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gurukripa",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: sizer.setSp(14),
                                fontFamily: "Sen",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: sizer.setHeight(2)),
                            Text(
                              "Paneer Butter Masala",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: sizer.setSp(12),
                                fontFamily: "Sen",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: sizer.setHeight(16)),

                    /// 🧡 Add To Cart Button
                    /// 🧡 Add To Cart Button
                    Container(
                      width: sizer.setWidth(343),
                      height: sizer.setHeight(130), // 🔽 130 se chhota
                      padding: EdgeInsets.symmetric(
                        horizontal: sizer.setWidth(14),
                        vertical: sizer.setHeight(10),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1
                        ),
                        color: AppColors.black.withOpacity(0.5),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: sizer.setWidth(5)),
                            child: CustomAppButton(
                              onTap: () {
                                debugPrint("Added to cart");
                              },
                              backgroundColor: const Color(0xFFFF7A00),
                              borderRadius: 12,
                              height: sizer.setHeight(50),
                              width: sizer.setWidth(174), // 🔥 yahi magic hai
                              child: CustomText(
                                  text: "Add to cart",
                                  fontSize: sizer.setSp(12),
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Sen"
                              ),
                            ),
                          ),
                          SizedBox(width: sizer.setWidth(12)),
                          Container(
                            height: sizer.setHeight(88),
                            width: sizer.setWidth(108),
                            margin: EdgeInsets.only(left: sizer.setWidth(5),bottom: sizer.setHeight(10)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.white,
                                  width: 1
                              ),
                              color: AppColors.black.withOpacity(0.5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(sizer.setWidth(8)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/png/burger.png", // apni image path daal
                                  width: sizer.setWidth(54),
                                  height: sizer.setWidth(54),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// 🔘 Right side icon widget
  Widget _iconCircle(IconData icon, Sizer sizer) {
    return Container(
      width: sizer.setWidth(47),
      height: sizer.setWidth(47),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: Colors.white,
        size: sizer.setWidth(34),
      ),
    );
  }
}
