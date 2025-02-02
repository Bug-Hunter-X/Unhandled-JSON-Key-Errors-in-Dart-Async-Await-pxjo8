```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
          for (var item in jsonData) {
            try {
              final name = item['name'] as String?; //Handle null or wrong type gracefully.
              print(name ?? 'Name key not found'); //Use null-aware operator
            } catch (e) {
              print('Error processing item: $e. Item: $item'); //More context in error message
            }
          }
      } else {
        throw Exception('Invalid JSON format: Expected a List');
      }
    } else {
      throw Exception('Failed to load data: Status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```