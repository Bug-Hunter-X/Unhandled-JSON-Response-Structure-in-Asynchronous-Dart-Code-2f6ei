```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Check if jsonData is a Map before accessing keys:
      if (jsonData is Map && jsonData.containsKey('key')) {
        final value = jsonData['key'];
        print('Value: $value');
      } else {
        print('Unexpected JSON structure. Data is not a map or does not contain the expected key.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```