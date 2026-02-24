import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C40FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const MyHomePage(),
    );
  }
}

// ==================== MOCK DATA ====================
class MockData {
  static final Random _random = Random();
  
  static final List<String> userNames = [
    'Emma Johnson', 'Liam Smith', 'Olivia Brown', 'Noah Williams', 
    'Ava Davis', 'Ethan Miller', 'Sophia Wilson', 'Mason Moore',
    'Isabella Taylor', 'James Anderson', 'Mia Thomas', 'Benjamin Jackson',
    'Charlotte White', 'Lucas Harris', 'Amelia Martin', 'Henry Garcia',
    'Harper Robinson', 'Alexander Clark', 'Evelyn Lewis', 'Daniel Walker'
  ];
  
  // Random profile picture URLs (using free avatar service)
  static final List<String> profilePictures = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
    'https://i.pravatar.cc/150?img=5',
    'https://i.pravatar.cc/150?img=6',
    'https://i.pravatar.cc/150?img=7',
    'https://i.pravatar.cc/150?img=8',
    'https://i.pravatar.cc/150?img=9',
    'https://i.pravatar.cc/150?img=10',
    'https://i.pravatar.cc/150?img=11',
    'https://i.pravatar.cc/150?img=12',
    'https://i.pravatar.cc/150?img=13',
    'https://i.pravatar.cc/150?img=14',
    'https://i.pravatar.cc/150?img=15',
    'https://i.pravatar.cc/150?img=16',
    'https://i.pravatar.cc/150?img=17',
    'https://i.pravatar.cc/150?img=18',
    'https://i.pravatar.cc/150?img=19',
    'https://i.pravatar.cc/150?img=20',
  ];
  
  // Random post image URLs (using picsum for random photos)
  static final List<String> postImages = [
    'https://picsum.photos/seed/post1/800/600',
    'https://picsum.photos/seed/post2/800/600',
    'https://picsum.photos/seed/post3/800/600',
    'https://picsum.photos/seed/post4/800/600',
    'https://picsum.photos/seed/post5/800/600',
    'https://picsum.photos/seed/post6/800/600',
    'https://picsum.photos/seed/post7/800/600',
    'https://picsum.photos/seed/post8/800/600',
    'https://picsum.photos/seed/post9/800/600',
    'https://picsum.photos/seed/post10/800/600',
  ];
  
  static final List<String> captions = [
    'Just launched my new project! 🚀 Really excited to share what I\'ve been working on.',
    'Beautiful day for an adventure! 🌟 #blessed #life',
    'Coffee and good vibes only ☕✨',
    'Making memories that last forever ❤️',
    'New beginnings, new adventures! 🌈',
    'Living my best life ✨',
    'Grateful for every moment 🙏',
    'Dream big, work hard, stay focused 💪',
    'Creating my own sunshine ☀️',
    'Adventure awaits! 🌍'
  ];
  
  static String getRandomName() {
    return userNames[_random.nextInt(userNames.length)];
  }
  
  static String getRandomProfilePicture() {
    return profilePictures[_random.nextInt(profilePictures.length)];
  }
  
  static String getRandomPostImage() {
    return postImages[_random.nextInt(postImages.length)];
  }
  
  static String getRandomCaption() {
    return captions[_random.nextInt(captions.length)];
  }
  
  static int getRandomTime() {
    return _random.nextInt(23) + 1;
  }
  
  static int getRandomLikes() {
    return _random.nextInt(5000) + 100;
  }
  
  static int getRandomComments() {
    return _random.nextInt(200) + 10;
  }
  
  static int getRandomShares() {
    return _random.nextInt(100) + 5;
  }
  
  static List<String> getShuffledNames(int count) {
    final shuffled = List<String>.from(userNames)..shuffle(_random);
    return shuffled.take(count).toList();
  }
  
  static List<String> getShuffledProfilePictures(int count) {
    final shuffled = List<String>.from(profilePictures)..shuffle(_random);
    return shuffled.take(count).toList();
  }
  
  static List<String> getShuffledPostImages(int count) {
    final shuffled = List<String>.from(postImages)..shuffle(_random);
    return shuffled.take(count).toList();
  }
  
  static final List<List<Color>> gradients = [
    [const Color(0xFFFF6B6B), const Color(0xFFFF8E72)],
    [const Color(0xFF4ECDC4), const Color(0xFF44A5A5)],
    [const Color(0xFF95E1D3), const Color(0xFFF38181)],
    [const Color(0xFFFA8072), const Color(0xFFFF6B9D)],
    [const Color(0xFFAE67FA), const Color(0xFFF49867)],
    [const Color(0xFF667EEA), const Color(0xFF764BA2)],
    [const Color(0xFFF093FB), const Color(0xFFF5576C)],
    [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
    [const Color(0xFFFA709A), const Color(0xFFFECC89)],
    [const Color(0xFF30CFD0), const Color(0xFF330867)],
  ];
  
  static List<Color> getRandomGradient() {
    return gradients[_random.nextInt(gradients.length)];
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF6C40FF),
          unselectedItemColor: Colors.grey[600],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_rounded),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            // UI only - no navigation
          },
        ),
      ),
    );
  }
}

// ==================== FEED PAGE ====================
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final randomNames = MockData.getShuffledNames(6);
    final randomPics = MockData.getShuffledProfilePictures(6);
    final randomPostImages = MockData.getShuffledPostImages(6);
    
    return CustomScrollView(
      slivers: [
        // Custom App Bar
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: const Color(0xFF121212),
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
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6C40FF), Color(0xFF9B59FF)],
                  ),
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
                color: const Color(0xFF6C40FF).withOpacity(0.1),
              ),
              child: const Icon(Icons.notifications_none_rounded,
                  color: Color(0xFF6C40FF)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6C40FF).withOpacity(0.1),
              ),
              child: const Icon(Icons.mail_outline_rounded,
                  color: Color(0xFF6C40FF)),
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
            (context, index) => _buildPostCard(index, randomNames[index], randomPics[index], randomPostImages[index]),
            childCount: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildStoriesSection() {
    final randomNames = MockData.getShuffledNames(8);
    final randomPics = MockData.getShuffledProfilePictures(8);
    
    return Container(
      color: const Color(0xFF121212),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Stories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // My Day - First story
                _buildMyDayStory(),
                // Other random users with real pictures
                ...List.generate(7, (index) => _buildStoryItem(index, randomNames[index], randomPics[index])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyDayStory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF6C40FF), Color(0xFF9B59FF)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C40FF).withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF121212), width: 3),
                    ),
                    child: const Icon(Icons.add_rounded,
                        color: Colors.white, size: 32),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'My Day',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(int index, String name, String profilePic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF6C40FF),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C40FF).withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                profilePic,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 32,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name.split(' ').first,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(int index, String userName, String profilePic, String postImage) {
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
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF6C40FF), width: 2),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      profilePic,
                      width: 46,
                      height: 46,
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
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${MockData.getRandomTime()}h ago • Public',
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
              MockData.getRandomCaption(),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white70,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                postImage,
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image_rounded,
                        size: 70,
                        color: Colors.white54,
                      ),
                    ),
                  );
                },
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
                _buildEngagementStat(Icons.favorite_rounded, '${MockData.getRandomLikes()}'),
                _buildEngagementStat(Icons.comment_rounded, '${MockData.getRandomComments()}'),
                _buildEngagementStat(Icons.share_rounded, '${MockData.getRandomShares()}'),
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
        Icon(icon, size: 16, color: const Color(0xFF6C40FF)),
        const SizedBox(width: 4),
        Text(
          count,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
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
    final randomPostImages = MockData.getShuffledPostImages(18);
    
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
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
            fillColor: const Color(0xFF2D2D2D),
            prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF6C40FF)),
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                randomPostImages[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image_rounded,
                        size: 50,
                        color: Colors.white54,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==================== REELS PAGE ====================
class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF6C40FF), Color(0xFF9B59FF)],
                ),
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
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildReelItem(index);
        },
      ),
    );
  }

  Widget _buildReelItem(int index) {
    final gradient = MockData.getRandomGradient();
    final userName = MockData.getRandomName();
    final profilePic = MockData.getRandomProfilePicture();
    final postImage = MockData.getRandomPostImage();

    return Stack(
      children: [
        // Video area - using real image
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Image.network(
            postImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradient,
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
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
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          profilePic,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.person_rounded,
                                color: Colors.white, size: 24);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${userName.toLowerCase().replaceAll(' ', '_')}',
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
    final randomPostImages = MockData.getShuffledPostImages(9);
    
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            backgroundColor: const Color(0xFF121212),
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF6C40FF).withOpacity(0.1),
                      ),
                      child: const Icon(Icons.settings_outlined,
                          color: Color(0xFF6C40FF)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Profile Header
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFF121212),
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
                    child: const Icon(Icons.person_rounded,
                        size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Name',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '@yourhandle',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Creative Designer | Content Creator | Traveler',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
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
                              color: const Color(0xFF6C40FF),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Share',
                              style: TextStyle(
                                color: Color(0xFF6C40FF),
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
              color: const Color(0xFF121212),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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
                            border: Border.all(
                              color: const Color(0xFF2D2D2D),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: gradients[index][0].withOpacity(0.2),
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
                                  'Story ${index + 1}',
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
              color: const Color(0xFF121212),
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
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
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            randomPostImages[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.blue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.image_rounded,
                                    size: 32,
                                    color: Colors.white54,
                                  ),
                                ),
                              );
                            },
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
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
