void main() {
  // ---------------------------
  // 1. Basic List.from
  // ---------------------------

  var numbers = [1, 2, 3];

  // List.from makes a NEW list, copying the elements
  var copy = List.from(numbers);

  print(copy); // [1, 2, 3]
  print(identical(numbers, copy));
  // false → different lists in memory, safe copy.

  // ---------------------------
  // 2. List<Type>.from (type enforcement)
  // ---------------------------

  var dynamicList = [1, "2", 3];
  // dynamicList is List<dynamic>

  // If we want List<int>, we enforce the type:
  try {
    var ints = List<int>.from(dynamicList);
    print(ints);
  } catch (e) {
    print(e);
    // Error: type 'String' is not a subtype of type 'int'
    // Because "2" cannot be cast to int.
  }

  // ---------------------------
  // 3. Comparing with .toList()
  // ---------------------------

  var list = [1, "2", 3];

  // Using .toList()
  var result1 = list.toList();
  print(result1.runtimeType); // List<dynamic>
  // Safe, but still dynamic → not strongly typed.

  // Using List<int>.from()
  try {
    var result2 = List<int>.from(list);
  } catch (e) {
    print(e);
    // Fails at runtime because "2" is not int
  }

  // ---------------------------
  // 4. With JSON (most common in Flutter)
  // ---------------------------

  var json = {
    "genre_ids": [28, 12, 16]
  };

  // JSON is dynamic, so we enforce type:
  var genreIds = List<int>.from(json['genre_ids'] ?? []);
  print(genreIds); // [28, 12, 16]
  print(genreIds.runtimeType); // List<int>

  // If json['genre_ids'] = null → fallback to []
  var genreIdsSafe = List<int>.from(json['missing_key'] ?? []);
  print(genreIdsSafe); // []

  // ---------------------------
  // 5. With map() + from
  // ---------------------------

  var users = [
    {"name": "Rawan"},
    {"name": "Sara"}
  ];

  // map() gives an Iterable, not a List
  var namesIterable = users.map((u) => u["name"]);
  print(namesIterable.runtimeType); // Iterable<String?>

  // Convert into a strongly typed List<String>:
  var names = List<String>.from(users.map((u) => u["name"] ?? ""));
  print(names); // [Rawan, Sara]
  print(names.runtimeType); // List<String>
}
