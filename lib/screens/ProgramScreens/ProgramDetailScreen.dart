import 'package:flutter/material.dart';
import 'package:learnsphere/widgets/colors.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../Feedback_page.dart';

class Programdetailscreen extends StatefulWidget {
  final Map<String, dynamic> courseData;
  bool isLearning;

  Programdetailscreen({
    super.key,
    required this.courseData,
    this.isLearning = false,
  });

  @override
  State<Programdetailscreen> createState() => _ProgramdetailscreenState();
}

class _ProgramdetailscreenState extends State<Programdetailscreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final modules = widget.courseData['modules'] as List<dynamic>;
    final instructor = widget.courseData['instructor_details'][0];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(widget.courseData['title']),
        backgroundColor: Colors.white,
        actions: const [Icon(Icons.share_outlined), SizedBox(width: 10)],
        elevation: 0,
      ),

      body: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Instructor Info
                  (widget.isLearning == false)
                      ? aboutAuthor(instructor)
                      : YoutubeVideoIframe(),

                  // Description
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.courseData['description'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Modules List
                  Column(
                    children: List.generate(modules.length, (index) {
                      final module = modules[index];
                      return programCard(
                        index + 1,
                        module['module_name'],
                        List<String>.from(module['topics']),
                        module['total_hours'],
                        module['chapters'],
                      );
                    }),
                  ),
                  SizedBox(height: 15),
                  (widget.isLearning == true)
                      ? FeedbackList(instructor: instructor)
                      : Container(),
                  SizedBox(height: 175),
                ],
              ),
            ),

      floatingActionButton: (widget.isLearning == false)
          ? Container(
              color: Colors.white,
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async{
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(Duration(seconds: 5));
                  setState(() {
                    isLoading = false;
                    widget.isLearning = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'You registered Sucessfully...',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Text(
                  (isLoading) ? 'Processing....' : 'Start Learning',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                // going to feedback page
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => CourseFeedbackPage()));
              },
              backgroundColor: AppColors.lightPurple,
              child: Icon(Icons.feedback_outlined, color: Colors.white),
            ),
      floatingActionButtonLocation: (widget.isLearning)
          ? null
          : FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget programCard(
    int index,
    String title,
    List<String> topics,
    String hours,
    String chapters,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.8, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MODULE $index',
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ],
        ),
        subtitle: Text(
          '$hours | $chapters',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        children: topics.map((t) => description(t)).toList(),
      ),
    );
  }

  Widget aboutAuthor(Map<String, dynamic> instructor) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/person/person.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                instructor['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '${instructor['rating']} ★ | ${instructor['total_courses']} Courses',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget description(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 0.8, color: Colors.grey.shade400),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 8.0,
            bottom: 8.0,
            right: 8.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget feedback() {
    return Card(
      child: ListTile(
        title: Text('Allen Preetham\n rating ★ ★ ★ ★'),
        leading: Icon(Icons.person_2_outlined),
        subtitle: Text(
          'Excelent Lecture by author, i understand inch by inch tq for this course',
        ),
      ),
    );
  }
}

class YoutubeVideoIframe extends StatefulWidget {
  const YoutubeVideoIframe({super.key});

  @override
  State<YoutubeVideoIframe> createState() => _YoutubeVideoIframeState();
}

class _YoutubeVideoIframeState extends State<YoutubeVideoIframe> {
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'XbQ-7zwuOdE', // only the ID
    autoPlay: true,
    params: const YoutubePlayerParams(
      showFullscreenButton: true,
      showControls: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        YoutubePlayerScaffold(
          controller: _controller,
          builder: (context, player) {
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15),
              child: player,
            );
          },
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3),
          ),
          child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
        ),
      ],
    );
  }
}

class FeedbackList extends StatelessWidget {
  const FeedbackList({super.key, required this.instructor});
  final Map<String, dynamic> instructor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [aboutAuthor(instructor), feedback()]),
    );
  }

  Widget aboutAuthor(Map<String, dynamic> instructor) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/person/person.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                instructor['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '${instructor['rating']} ★ | ${instructor['total_courses']} Courses',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget feedback() {
    return Card(
      child: ListTile(
        title: Text('Allen Preetham'),
        leading: Icon(Icons.person_2_outlined),
        subtitle: Text(
          'Excelent Lecture by author, i understand inch by inch tq for this course',
        ),
      ),
    );
  }
}
