import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false, // Mengatur floating menjadi false
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Welcome, Renjie!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              titlePadding: EdgeInsets.only(left: 16, top: 0),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressJumbotron(),
                  const SizedBox(height: 20),
                  _buildMenuGrid(context),
                  const SizedBox(height: 20),
                  const YourTaskList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressJumbotron() {
    const double progressPercentage = 88.0;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 245, 166, 35),
            Color.fromARGB(255, 255, 226, 95),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task Progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const LinearProgressIndicator(
            value: progressPercentage / 100,
            backgroundColor: Colors.white54,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            '${progressPercentage.toStringAsFixed(1)}% Completed',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildMenuItem(
          context,
          icon: Icons.announcement,
          title: 'Announce',
          color: Colors.blue,
          onTap: () {
            // TODO: Navigate to Announcements screen
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.assignment,
          title: 'Assignments',
          color: Colors.red,
          onTap: () {
            // TODO: Navigate to Assignments screen
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.calendar_today,
          title: 'Calendar',
          color: Colors.green,
          onTap: () {
            // TODO: Navigate to Academic Calendar screen
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.book,
          title: 'Course',
          color: Colors.purple,
          onTap: () {
            // TODO: Navigate to Study Materials screen
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.forum,
          title: 'Form',
          color: const Color.fromARGB(255, 10, 243, 255),
          onTap: () {
            // TODO: Navigate to Discussion Forum screen
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.more_horiz,
          title: 'More',
          color: Colors.grey,
          onTap: () {
            // TODO: Navigate to More screen
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap,
      required Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YourTaskList extends StatelessWidget {
  const YourTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Task',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _buildTaskItem(
          taskTitle: 'Web Programming',
          done: '8/12 Done',
          deadline: '1 Deadline',
          pending: '2 Pending',
          progress: 0.72,
        ),
        const SizedBox(height: 10),
        _buildTaskItem(
          taskTitle: 'Mobile Programming',
          done: '8/9 Done',
          deadline: '0 Deadline',
          pending: '1 Pending',
          progress: 0.97,
        ),
        const SizedBox(height: 10),
        _buildTaskItem(
          taskTitle: 'Kewirausahaan',
          done: '15/18 Done',
          deadline: '6 Deadline',
          pending: '3 Pending',
          progress: 0.89,
        ),
        const SizedBox(height: 10),
        _buildTaskItem(
          taskTitle: 'Matematika',
          done: '9/10 Done',
          deadline: '1 Deadline',
          pending: '0 Pending',
          progress: 0.9,
        ),
      ],
    );
  }

  Widget _buildTaskItem({
    required String taskTitle,
    required String done,
    required String deadline,
    required String pending,
    required double progress,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade300,
            Colors.blue.shade600,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildTaskStatus(done, Colors.green),
                  const SizedBox(width: 5),
                  _buildTaskStatus(deadline, Colors.red),
                  const SizedBox(width: 5),
                  _buildTaskStatus(pending, Colors.orange),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white38,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 4,
              ),
            ],
          ),
          Positioned(
            right: 10,
            child: Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskStatus(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
