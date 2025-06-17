import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'project_model.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProjectsSection extends StatefulWidget {
  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A0E27),
            Color(0xFF1A237E).withOpacity(0.8),
            Color(0xFF0A0E27),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  'My Projects',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Showcasing innovative solutions across various domains',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
                    ),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF00FFFF).withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xFF1A237E).withOpacity(0.4),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Color(0xFF00FFFF).withOpacity(0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00FFFF), Color(0xFF0099FF)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF00FFFF).withOpacity(0.4),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              labelColor: Color(0xFF0A0E27),
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              tabs: [
                Tab(text: 'Live Apps'),
                Tab(text: 'AI Based Apps'),
                Tab(text: 'ML Based Projects'),
                Tab(text: 'Sensor Projects'),
                Tab(text: 'E-Commerce Projects'),
                Tab(text: 'Other Projects'),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 800,
            child: TabBarView(
              controller: _tabController,
              children: [
                ProjectGrid(projects: liveApps),
                ProjectGrid(projects: aiapps),
                ProjectGrid(projects: mlApps),
                ProjectGrid(projects: sensorApps),
                ProjectGrid(projects: ecommerce),
                ProjectGrid(projects: Others),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectGrid({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1200) return 3;
      if (screenWidth >= 800) return 2;
      return 1;
    }

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(),
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        childAspectRatio: 0.75,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _imageLoadError = false;
  bool _showVideo = false;
  bool _isHovered = false;
  bool _videoInitialized = false;
  bool _videoLoadError = false;
  late PageController _pageController;
  int _currentImageIndex = 0;
  Timer? _autoSlideTimer;
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.project.imageUrls != null && widget.project.imageUrls!.length > 1) {
      _startAutoSlide();
    }
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (mounted && !_showVideo && !_imageLoadError) {
        final imageUrls = widget.project.imageUrls!;
        int nextPage = (_currentImageIndex + 1) % imageUrls.length;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  String _convertGoogleDriveUrl(String url) {
    if (url.contains('drive.google.com')) {
      if (url.contains('/file/d/')) {
        final fileId = url.split('/file/d/')[1].split('/')[0];
        return 'https://drive.google.com/uc?export=view&id=$fileId';
      } else if (url.contains('id=')) {
        return url;
      }
    }
    return url;
  }

  String? _getYouTubeVideoId(String url) {
    // Handle different YouTube URL formats
    final regExp = RegExp(
      r'(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/|youtube\.com\/shorts\/)([^"&?\/\s]{11})',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(url);
    return match?.group(1);
  }

  String? _getDirectVideoUrl() {
    if (widget.project.videoUrl == null) return null;

    final videoUrl = widget.project.videoUrl!;

    // Check if it's a YouTube URL
    if (videoUrl.contains('youtube.com') || videoUrl.contains('youtu.be')) {
      // For YouTube videos, we can't get direct URLs due to API restrictions
      // Return null to use iframe embed instead
      return null;
    }

    // Handle Google Drive URLs
    if (videoUrl.contains('drive.google.com')) {
      return _convertGoogleDriveUrl(videoUrl);
    }

    // Return direct video URLs as-is
    return videoUrl;
  }

  void _initializeVideoPlayer() async {
    final directUrl = _getDirectVideoUrl();

    if (directUrl != null) {
      try {
        print('Initializing video: $directUrl');

        _videoController = VideoPlayerController.network(
          directUrl,
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: false,
          ),
        );

        await _videoController!.initialize();

        _chewieController = ChewieController(
          videoPlayerController: _videoController!,
          autoPlay: false,
          looping: true,
          aspectRatio: _videoController!.value.aspectRatio,
          showControls: true,
          showOptions: false,
          showControlsOnInitialize: true,
          errorBuilder: (context, errorMessage) {
            print('Video error: $errorMessage');
            return Container(
              color: Color(0xFF1A237E),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 40),
                    SizedBox(height: 10),
                    Text(
                      'Video unavailable',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        if (mounted) {
          setState(() {
            _videoInitialized = true;
            _videoLoadError = false;
          });
        }
      } catch (e) {
        print('Error initializing video: $e');
        if (mounted) {
          setState(() {
            _videoInitialized = false;
            _videoLoadError = true;
          });
        }
      }
    }
  }

  void _openVideoInNewTab() {
    if (widget.project.videoUrl != null) {
      if (kIsWeb) {
        html.window.open(widget.project.videoUrl!, '_blank');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A237E).withOpacity(0.8),
              Color(0xFF0A0E27).withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? Color(0xFF00FFFF).withOpacity(0.6)
                : Color(0xFF00FFFF).withOpacity(0.3),
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Color(0xFF00FFFF).withOpacity(0.3)
                  : Colors.black.withOpacity(0.3),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: _buildMediaContent(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Text(
                            widget.project.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.technologies
                          .take(7)
                          .map((tech) => TechChip(tech: tech))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaContent() {
    // Priority: Show video if requested and can be embedded, then images, then icon
    if (_showVideo && widget.project.videoUrl != null) {
      return _buildVideoContent();
    }

    // Multiple images
    if (widget.project.imageUrls != null &&
        widget.project.imageUrls!.isNotEmpty &&
        widget.project.imageUrls!.length > 1 &&
        !_imageLoadError) {
      return _buildImageCarousel();
    }

    // Single image
    String? singleImageUrl;
    if (widget.project.imageUrl != null && widget.project.imageUrl!.isNotEmpty) {
      singleImageUrl = widget.project.imageUrl;
    } else if (widget.project.imageUrls != null &&
        widget.project.imageUrls!.isNotEmpty) {
      singleImageUrl = widget.project.imageUrls!.first;
    }

    if (singleImageUrl != null && !_imageLoadError) {
      return _buildSingleImage(singleImageUrl);
    }

    return _buildIconContent();
  }

  Widget _buildImageCarousel() {
    final imageUrls = widget.project.imageUrls!;

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            if (mounted) {
              setState(() {
                _currentImageIndex = index;
              });
            }
          },
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            final imageUrl = _convertGoogleDriveUrl(imageUrls[index]);
            return Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              headers: kIsWeb ? {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
              } : null,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Color(0xFF1A237E),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                      color: Color(0xFF00FFFF),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                print('Image load error: $error');
                return Container(
                  color: Color(0xFF1A237E),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, color: Colors.grey, size: 40),
                        SizedBox(height: 8),
                        Text(
                          'Image ${index + 1} unavailable',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),

        // Page indicators
        if (imageUrls.length > 1)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                    (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentImageIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Color(0xFF00FFFF)
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),

        // Video button
        if (widget.project.videoUrl != null)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(
                  _showVideo ? Icons.image : Icons.play_circle_filled,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  // Check if it's YouTube video
                  if (widget.project.videoUrl!.contains('youtube.com') ||
                      widget.project.videoUrl!.contains('youtu.be')) {
                    _openVideoInNewTab();
                  } else {
                    setState(() {
                      _showVideo = !_showVideo;
                      if (_showVideo) {
                        _autoSlideTimer?.cancel();
                        if (!_videoInitialized && !_videoLoadError) {
                          _initializeVideoPlayer();
                        }
                      } else if (widget.project.imageUrls!.length > 1) {
                        _startAutoSlide();
                      }
                    });
                  }
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSingleImage(String imageUrl) {
    final convertedUrl = _convertGoogleDriveUrl(imageUrl);

    return Stack(
      children: [
        Image.network(
          convertedUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          headers: kIsWeb ? {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
          } : null,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Color(0xFF1A237E),
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                  color: Color(0xFF00FFFF),
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            print('Single image load error: $error');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  _imageLoadError = true;
                });
              }
            });
            return _buildIconContent();
          },
        ),

        // Video button
        if (widget.project.videoUrl != null)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(
                  _showVideo ? Icons.image : Icons.play_circle_filled,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  // Check if it's YouTube video
                  if (widget.project.videoUrl!.contains('youtube.com') ||
                      widget.project.videoUrl!.contains('youtu.be')) {
                    _openVideoInNewTab();
                  } else {
                    setState(() {
                      _showVideo = !_showVideo;
                      if (_showVideo && !_videoInitialized && !_videoLoadError) {
                        _initializeVideoPlayer();
                      }
                    });
                  }
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildVideoContent() {
    final videoUrl = widget.project.videoUrl!;

    // For YouTube videos, show embedded iframe
    if (videoUrl.contains('youtube.com') || videoUrl.contains('youtu.be')) {
      return _buildYouTubeEmbed();
    }

    // For other videos, use video player
    if (_videoInitialized &&
        _chewieController != null &&
        _videoController != null &&
        _videoController!.value.isInitialized &&
        !_videoLoadError) {
      return Stack(
        children: [
          Chewie(controller: _chewieController!),

          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.image, color: Colors.white, size: 28),
                onPressed: () {
                  setState(() {
                    _showVideo = false;
                    if (widget.project.imageUrls != null &&
                        widget.project.imageUrls!.length > 1) {
                      _startAutoSlide();
                    }
                  });
                },
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        color: Color(0xFF1A237E),
        child: Stack(
          children: [
            Center(
              child: _videoLoadError
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 40),
                  SizedBox(height: 10),
                  Text(
                    'Video unavailable',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _openVideoInNewTab,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00FFFF),
                      foregroundColor: Color(0xFF0A0E27),
                    ),
                    child: Text('Open in Browser'),
                  ),
                ],
              )
                  : CircularProgressIndicator(color: Color(0xFF00FFFF)),
            ),

            Positioned(
              top: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: Icon(Icons.image, color: Colors.white, size: 28),
                  onPressed: () {
                    setState(() {
                      _showVideo = false;
                      _imageLoadError = false;
                      if (widget.project.imageUrls != null &&
                          widget.project.imageUrls!.length > 1) {
                        _startAutoSlide();
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildYouTubeEmbed() {
    final videoId = _getYouTubeVideoId(widget.project.videoUrl!);

    if (videoId != null && kIsWeb) {
      // Create a WebViewController instance
      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (NavigationRequest request) {
              // Allow YouTube embed URL to load
              if (request.url.contains('youtube.com')) {
                return NavigationDecision.navigate;
              }
              return NavigationDecision.prevent;
            },
          ),
        )
        ..loadRequest(Uri.parse('https://www.youtube.com/embed/$videoId?autoplay=0&controls=1&rel=0'));

      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.image, color: Colors.white, size: 28),
                onPressed: () {
                  setState(() {
                    _showVideo = false;
                    if (widget.project.imageUrls != null &&
                        widget.project.imageUrls!.length > 1) {
                      _startAutoSlide();
                    }
                  });
                },
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        color: Color(0xFF1A237E),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.video_library, color: Color(0xFF00FFFF), size: 60),
              SizedBox(height: 15),
              Text(
                'YouTube Video',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _openVideoInNewTab,
                icon: Icon(Icons.open_in_new, size: 18),
                label: Text('Watch on YouTube'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00FFFF),
                  foregroundColor: Color(0xFF0A0E27),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildIconContent() {
    return Container(
      color: Color(0xFF1A237E),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.project.icon ?? Icons.code,
              size: 60,
              color: Color(0xFF00FFFF),
            ),
            SizedBox(height: 10),
            Text(
              widget.project.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget.project.videoUrl != null) ...[
              SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: _openVideoInNewTab,
                icon: Icon(Icons.play_arrow, size: 18),
                label: Text('Watch Video'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00FFFF),
                  foregroundColor: Color(0xFF0A0E27),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class TechChip extends StatelessWidget {
  final String tech;

  const TechChip({Key? key, required this.tech}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF00FFFF).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.5),
        ),
      ),
      child: Text(
        tech,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}