```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response is a JSON array
      final List<dynamic> data = jsonDecode(response.body);
      // Accessing elements
      for (var item in data) {
        print(item['name']); //This will throw an error if 'name' key is missing
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e'); //This only prints generic error message
  }
}
```