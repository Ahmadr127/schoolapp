import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[900]
                        : Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildShareCard(context),
              const SizedBox(height: 30),
              _buildPopularCoursesSection(context),
              const SizedBox(height: 30),
              _buildContinueLearningSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShareCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Share With\nFriends',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          ElevatedButton(
            onPressed: () {},
            child: Text('Share'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCoursesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('POPULAR COURSES',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Icon(Icons.more_horiz),
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 10),
              _buildCourseIcon(context, 'Biology', Icons.biotech, Colors.red),
              const SizedBox(width: 40),
              _buildCourseIcon(
                  context, 'Science', Icons.science, Colors.orange),
              const SizedBox(width: 40),
              _buildCourseIcon(
                  context, 'Design', Icons.design_services, Colors.blue),
              const SizedBox(width: 40),
              _buildCourseIcon(
                  context, 'Cooking', Icons.restaurant, Colors.green),
              const SizedBox(width: 40),
              _buildCourseIcon(context, 'Robotics',
                  Icons.precision_manufacturing, Colors.purple),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseIcon(
      BuildContext context, String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.white,
            child: Icon(icon, size: 30, color: color),
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildContinueLearningSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CONTINUE LEARNING',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Icon(Icons.more_horiz),
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildLearningCard(
                  context, 'Science', 'Chapter 4', Colors.red, Icons.science),
              _buildLearningCard(context, 'Design', 'Chapter 6', Colors.orange,
                  Icons.design_services),
              _buildLearningCard(
                  context, 'Biology', 'Chapter 2', Colors.blue, Icons.science),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLearningCard(BuildContext context, String title, String chapter,
      Color color, IconData icon) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Color.fromARGB(136, 0, 0, 0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(icon, color: color, size: 40),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            chapter,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                  ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 70),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Theme.of(context).iconTheme.color,
                size: 14,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Terakhir dilihat 5 jam yang lalu',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
