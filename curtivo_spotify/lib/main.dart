import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curtivo — Flutter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF071217),
        colorScheme: ColorScheme.dark(primary: const Color(0xFF1DB954)),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Inter'),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool playing = false;
  bool following = false;
  int currentIndex = 0;

  final items = List.generate(18, (i) => {
        'id': i + 1,
        'title': 'Track ${i + 1}',
        'sub': 'Artist ${i + 1}',
        'img': 'https://picsum.photos/seed/album${i + 1}/400/400'
      });

  void playItem(int index) {
    // Functionality disabled
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (isWide) _buildSidebar(),
            Expanded(
              child: Column(
                children: [
                  _buildTopbar(),
                  Expanded(child: _buildContent()),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottom player overlay
      bottomNavigationBar: _buildPlayer(),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 240,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0x0FFFFFFF), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: const Color(0xFF121416),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w800, fontSize: 20)),
          const SizedBox(height: 12),
          _navItem('Home', active: true),
          _navItem('Search'),
          _navItem('Your Library'),
          const Divider(color: Color(0x1AFFFFFF)),
          _navItem('Liked Songs'),
          _navItem('Made for You'),
          const Spacer(),
          Text('Logged in as you', style: TextStyle(color: Color.fromRGBO(255,255,255,0.7), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _navItem(String title, {bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(title, style: TextStyle(color: active ? Colors.white : Colors.white70)),
    );
  }

  Widget _buildTopbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(color: const Color(0xFF121416), borderRadius: BorderRadius.circular(999)),
                child: const Text('Search artists, songs, or podcasts', style: TextStyle(color: Colors.white70)),
              ),
            ],
          ),
          Text('Welcome back — enjoy your music', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final current = items[currentIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // hero
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(current['img'] as String, width: 140, height: 140, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chill', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text('A calm selection — Updated daily • 45 songs', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: null,
                            child: Text(following ? 'Following' : 'Follow'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary, foregroundColor: Colors.black),
                            onPressed: null,
                            child: const Text('Play'),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // grid of cards
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                        decoration: BoxDecoration(color: const Color(0xFF121416), borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(item['img'] as String, height: 120, width: double.infinity, fit: BoxFit.cover)),
                            const SizedBox(height: 8),
                            Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(item['sub'] as String, style: TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      );
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayer() {
    final current = items[currentIndex];

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Color.fromRGBO(0,0,0,0.6), borderRadius: BorderRadius.circular(12)),
      height: 88,
      child: Row(
        children: [
          Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(current['img'] as String, width: 60, height: 60, fit: BoxFit.cover)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(current['title'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(current['sub'] as String, style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              )
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: null, icon: const Icon(Icons.skip_previous)),
                    IconButton(
                      onPressed: null,
                      icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                      color: Colors.white,
                      iconSize: 28,
                    ),
                    IconButton(onPressed: null, icon: const Icon(Icons.skip_next)),
                  ],
                ),
                const SizedBox(height: 8),
                // simple progress bar
                LinearProgressIndicator(value: 0.24, color: Theme.of(context).colorScheme.primary, backgroundColor: Colors.white12),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: null, icon: const Icon(Icons.favorite_border)),
              IconButton(onPressed: null, icon: const Icon(Icons.shuffle)),
            ],
          )
        ],
      ),
    );
  }
}
