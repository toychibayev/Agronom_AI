import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff81C784)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Tarix", style: TextStyle(color: Color(0xff81C784))),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xff81C784)),
            onPressed: () {},
          ),
        ],
      ),
      body: HistoryWidget(history: history),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.history,
  });

  final List<Map<String, String>> history;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                      "https://randomuser.me/api/portraits/men/$index.jpg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(history[index]["title"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff81C784))),
                    const SizedBox(height: 4),
                    Text(
                        "${history[index]["date"]}    ${history[index]["time"]}",
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Map<String, String>> history = [
  {"title": "Pomidor shox qurti", "date": "20 Sep 2023", "time": "11:45 am"},
  {"title": "Pomidor shox qurti", "date": "20 Sep 2023", "time": "11:02 am"},
  {"title": "Pomidor shox qurti", "date": "12 Sep 2023", "time": "02:05 pm"},
  {"title": "Pomidor shox qurti", "date": "02 Sep 2023", "time": "08:45 pm"},
];
