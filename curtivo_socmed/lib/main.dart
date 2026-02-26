import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C40FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FeedPage(),
    const ExplorePage(),
    const ReelsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF1E1E1E),
          elevation: 0,
          selectedItemColor: const Color(0xFF9B59FF),
          unselectedItemColor: Colors.grey[600],
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.home_rounded, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.explore_rounded, 1),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.play_circle_fill, 2),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.person_rounded, 3),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? const Color(0xFF9B59FF).withOpacity(0.2)
            : Colors.transparent,
      ),
      child: Icon(icon),
    );
  }
}

// ==================== FEED PAGE ====================
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Custom App Bar
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: const Color(0xFF1E1E1E),
          elevation: 0,
          expandedHeight: 0,
          toolbarHeight: 70,
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6C40FF),
                      const Color(0xFF9B59FF).withOpacity(0.8),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6C40FF).withOpacity(0.4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(Icons.hub_rounded,
                    color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              const Text(
                'SocialHub',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF9B59FF).withOpacity(0.2),
              ),
              child: const Icon(Icons.notifications_none_rounded,
                  color: Color(0xFF9B59FF)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF9B59FF).withOpacity(0.2),
              ),
              child: const Icon(Icons.mail_outline_rounded,
                  color: Color(0xFF9B59FF)),
            ),
          ],
        ),
        // Stories Section
        SliverToBoxAdapter(
          child: _buildStoriesSection(),
        ),
        // Posts Feed
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildPostCard(index),
            childCount: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Your Stories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[300],
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(7, (index) => _buildStoryItem(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(int index) {
    // Real profile images from Unsplash
    final storyImages = [
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
      'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150',
    ];

    final storyNames = [
      'Emma Wilson',
      'James Brown',
      'Olivia Davis',
      'William Miller',
      'Sophia Garcia',
      'Benjamin Lee',
      'Ava Martinez',
    ];

    final gradients = [
      [const Color(0xFFFF6B6B), const Color(0xFFFF8E72)],
      [const Color(0xFF4ECDC4), const Color(0xFF44A5A5)],
      [const Color(0xFF95E1D3), const Color(0xFFF38181)],
      [const Color(0xFFFA8072), const Color(0xFFFF6B9D)],
      [const Color(0xFFAE67FA), const Color(0xFFF49867)],
      [const Color(0xFF6C40FF), const Color(0xFF9B59FF)],
      [const Color(0xFF00D9FF), const Color(0xFF00FF94)],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // Story with gradient border
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradients[index],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: gradients[index][0].withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF1E1E1E),
                  width: 3,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  storyImages[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: const Color(0xFF2A2A2A),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF9B59FF),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF2A2A2A),
                      child: const Icon(Icons.person, color: Colors.white54),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 72,
            child: Text(
              storyNames[index],
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(int index) {
    // Real post images from Unsplash
    final postImages = [
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800',
      'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=800',
      'https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=800',
      'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
      'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800',
    ];

    final postNames = [
      'Sophia Martinez',
      'Daniel Thompson',
      'Olivia Carter',
      'Michael Reyes',
      'Isabella Cruz',
      'Alexander Kim',
    ];

    final postUsernames = [
      '@sophiamartinez',
      '@danielthompson',
      '@oliviacarter',
      '@michaelreyes',
      '@isabellacruz',
      '@alexanderkim',
    ];

    final captions = [
      'Spent the weekend hiking in the mountains 🌄 Nature truly heals the soul.',
      'Golden hour at the beach never gets old ✨ #blessed #ocean',
      'City lights and late nights 🌃 Nothing beats this view!',
      'Adventure awaits around every corner 🏔️ What\'s your next destination?',
      'Coffee and good vibes only ☕ Sometimes the simplest moments are the best.',
      'Lost in nature, found myself 🌲 The mountains are calling!',
    ];

    final postTimes = ['2h', '4h', '6h', '8h', '12h', '1d'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Profile Image
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF6C40FF),
                        const Color(0xFF9B59FF),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C40FF).withOpacity(0.4),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.person_rounded,
                            color: Colors.white, size: 28);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postNames[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${postTimes[index]} ago • Public',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[800],
                  ),
                  child: const Icon(Icons.more_horiz_rounded,
                      size: 20, color: Colors.white70),
                ),
              ],
            ),
          ),
          // Post Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              captions[index],
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Post Image
          Container(
            width: double.infinity,
            height: 280,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                children: [
                  Image.network(
                    postImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: const Color(0xFF2A2A2A),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF9B59FF),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF2A2A2A),
                        child: const Center(
                          child: Icon(Icons.image_rounded,
                              size: 70, color: Colors.white30),
                        ),
                      );
                    },
                  ),
                  // Like badge overlay
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite_rounded,
                              size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            'Like',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Engagement Stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEngagementStat(Icons.favorite_rounded, '${234 + index * 50}'),
                _buildEngagementStat(Icons.comment_rounded, '${12 + index * 5}'),
                _buildEngagementStat(Icons.share_rounded, '${3 + index * 2}'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Action Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.favorite_outline_rounded, 'Like', 0),
                _buildActionButton(Icons.chat_bubble_outline_rounded, 'Comment', 1),
                _buildActionButton(Icons.share_rounded, 'Share', 2),
                _buildActionButton(Icons.send_outlined, 'Send', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEngagementStat(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF9B59FF)),
        const SizedBox(width: 4),
        Text(
          count,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, int index) {
    final buttonColors = [
      const Color(0xFFFF6B6B),
      const Color(0xFF4ECDC4),
      const Color(0xFFFFE66D),
      const Color(0xFF95E1D3),
    ];

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: buttonColors[index]),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: buttonColors[index],
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== EXPLORE PAGE ====================
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Discover people, hashtags...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFF2A2A2A),
            prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF9B59FF)),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: 18,
        itemBuilder: (context, index) {
          final gradients = [
            [const Color(0xFF667EEA), const Color(0xFF764BA2)],
            [const Color(0xFFF093FB), const Color(0xFFF5576C)],
            [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
            [const Color(0xFFFA709A), const Color(0xFFFECC89)],
            [const Color(0xFF30CFD0), const Color(0xFF330867)],
            [const Color(0xFFA8EDEA), const Color(0xFFFED6E3)],
          ];

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: gradients[index % gradients.length],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: gradients[index % gradients.length][0].withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.image_rounded,
                    size: 50,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          size: 12,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${500 + index * 100}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==================== REELS PAGE ====================
class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6C40FF),
                    const Color(0xFF9B59FF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C40FF).withOpacity(0.4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(Icons.play_circle_filled,
                  color: Colors.white, size: 18),
            ),
            const SizedBox(width: 8),
            const Text(
              'Reels',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildReelItem(index);
        },
      ),
    );
  }

  Widget _buildReelItem(int index) {
    final gradients = [
      [const Color(0xFF667EEA), const Color(0xFF764BA2)],
      [const Color(0xFFF093FB), const Color(0xFFF5576C)],
      [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
      [const Color(0xFFFA709A), const Color(0xFFFECC89)],
      [const Color(0xFF30CFD0), const Color(0xFF330867)],
    ];

    final reelImages = [
      'https://images.unsplash.com/photo-1518837695005-2083093ee35b?w=800',
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
      'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=800',
      'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800',
      'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800',
    ];

    return Stack(
      children: [
        // Video area with real image
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
          ),
          child: Image.network(
            reelImages[index % reelImages.length],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradients[index % gradients.length],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Reel ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        // Side Actions
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            children: [
              _buildReelAction(Icons.favorite_rounded, '${2500 + index * 300}'),
              const SizedBox(height: 24),
              _buildReelAction(Icons.comment_rounded, '${150 + index * 20}'),
              const SizedBox(height: 24),
              _buildReelAction(Icons.share_rounded, '${80 + index * 10}'),
            ],
          ),
        ),
        // Bottom Info
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: gradients[index % gradients.length],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: gradients[index % gradients.length][0]
                                .withOpacity(0.4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.person_rounded,
                          color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${['sophiamartinez', 'danielthompson', 'oliviacarter', 'michaelreyes', 'isabellacruz'][index % 5]}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Trending Now',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Amazing content with trending audio! 🔥 #viral #foryou #trending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReelAction(IconData icon, String count) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
            border: Border.all(color: Colors.white, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ==================== PROFILE PAGE ====================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            backgroundColor: const Color(0xFF1E1E1E),
            elevation: 0,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF9B59FF).withOpacity(0.2),
                  ),
                  child: const Icon(Icons.settings_outlined,
                      color: Color(0xFF9B59FF)),
                ),
              ),
            ],
          ),
          // Profile Header
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFF1E1E1E),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C40FF), Color(0xFF9B59FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C40FF).withOpacity(0.4),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person_rounded,
                              size: 60, color: Colors.white);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Daniel Thompson',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '@danielthompson',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9B59FF),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Photographer | Content Creator | Adventure Seeker',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileStat('2.3K', 'Posts'),
                      _buildProfileStat('45.6K', 'Followers'),
                      _buildProfileStat('1.2K', 'Following'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6C40FF), Color(0xFF9B59FF)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6C40FF).withOpacity(0.3),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF9B59FF),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Share',
                              style: TextStyle(
                                color: Color(0xFF9B59FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Highlights
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFF1E1E1E),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final gradients = [
                          [const Color(0xFFFF6B6B), const Color(0xFFFF8E72)],
                          [const Color(0xFF4ECDC4), const Color(0xFF44A5A5)],
                          [const Color(0xFF95E1D3), const Color(0xFFF38181)],
                          [const Color(0xFFFA8072), const Color(0xFFFF6B9D)],
                        ];

                        return Container(
                          width: 85,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: gradients[index],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: gradients[index][0].withOpacity(0.3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_rounded,
                                  size: 28,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  ['Travel', 'Food', 'Nature', 'Life'][index],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Posts Grid
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFF1E1E1E),
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final gradients = [
                        [const Color(0xFF667EEA), const Color(0xFF764BA2)],
                        [const Color(0xFFF093FB), const Color(0xFFF5576C)],
                        [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
                        [const Color(0xFFFA709A), const Color(0xFFFECC89)],
                        [const Color(0xFF30CFD0), const Color(0xFF330867)],
                        [const Color(0xFFA8EDEA), const Color(0xFFFED6E3)],
                      ];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: gradients[index % gradients.length],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: gradients[index % gradients.length][0]
                                  .withOpacity(0.2),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_rounded,
                            size: 32,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
