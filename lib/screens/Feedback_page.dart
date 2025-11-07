import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseFeedbackPage extends StatefulWidget {
  const CourseFeedbackPage({super.key});

  @override
  State<CourseFeedbackPage> createState() => _CourseFeedbackPageState();
}

class _CourseFeedbackPageState extends State<CourseFeedbackPage> {
  double courseRating = 0;
  double instructorRating = 0;
  String? contentQuality;
  String? learningClarity;
  String? appExperience;
  String? recommendation;
  String? confidenceLevel;
  final TextEditingController suggestionController = TextEditingController();
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course Feedback"), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "1. Overall Course Rating",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: courseRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) => setState(() => courseRating = rating),
            ),
            const SizedBox(height: 20),

            const Text(
              "2. Course Content Quality",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: ["Excellent", "Good", "Average", "Poor"].map((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: contentQuality,
                  onChanged: (val) => setState(() => contentQuality = val),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            const Text(
              "3. Instructor Clarity",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: instructorRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) =>
                  setState(() => instructorRating = rating),
            ),
            const SizedBox(height: 20),

            const Text(
              "4. Did the videos help you understand clearly?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: ["Yes", "Somewhat", "No"].map((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: learningClarity,
                  onChanged: (val) => setState(() => learningClarity = val),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            const Text(
              "5. Was the app easy to use?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: ["Yes", "Somewhat", "No"].map((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: appExperience,
                  onChanged: (val) => setState(() => appExperience = val),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            const Text(
              "6. Do you feel confident to apply what you learned?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: confidenceLevel,
              hint: const Text("Select confidence level"),
              items: ["Yes", "Maybe", "Not yet"].map((val) {
                return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (val) => setState(() => confidenceLevel = val),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),

            const Text(
              "7. Would you recommend this course?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: ["Yes", "No"].map((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: recommendation,
                  onChanged: (val) => setState(() => recommendation = val),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            const Text(
              "8. Your Suggestions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: suggestionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Write your feedback or suggestions here...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send, color: Colors.white),
                label: isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Submit Feedback",
                        style: TextStyle(color: Colors.white),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: isSubmitting
                    ? null
                    : () async {
                        setState(() => isSubmitting = true);

                        // TODO: Save to Supabase here
                        await Future.delayed(const Duration(seconds: 2));

                        setState(() => isSubmitting = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Feedback submitted successfully!"),
                          ),
                        );
                        suggestionController.clear();
                        setState(() {
                          courseRating = 0;
                          instructorRating = 0;
                          contentQuality = null;
                          learningClarity = null;
                          appExperience = null;
                          recommendation = null;
                          confidenceLevel = null;
                        });
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
