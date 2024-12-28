import 'package:flutter/material.dart';

class ScoreCalculator extends StatefulWidget {
  const ScoreCalculator({super.key});

  @override
  State<ScoreCalculator> createState() => _ScoreCalculatorState();
}

class _ScoreCalculatorState extends State<ScoreCalculator> {
  List<int> scores = [];
  final TextEditingController _controller = TextEditingController();

  Map<String, int> calculateScore(List<int> scores) {
    int totalScore = 0;
    int validThrows = 0;

    for (int score in scores) {
      if (score > 0) {
        totalScore += score;
        validThrows++;
      }
    }

    return {'totalScore': totalScore, 'validThrows': validThrows};
  }

  void addScore() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        scores.add(int.parse(_controller.text));
        _controller.clear();
      });
    }
  }

  void resetScores() {
    setState(() {
      scores.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var result = calculateScore(scores);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Punkte Rechner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Punktzahl eingeben',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: addScore,
                  child: const Text('Punktzahl hinzufügen'),
                ),
                ElevatedButton(
                  onPressed: resetScores,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Zurücksetzen'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Gesamtpunktzahl: ${result['totalScore']}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Anzahl gültiger Würfe: ${result['validThrows']}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: scores.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Wurf ${index + 1}: ${scores[index]} Punkte'),
                      tileColor:
                          scores[index] > 0 ? Colors.green[50] : Colors.red[50],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
