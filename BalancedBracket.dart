import 'dart:io';

String balancedBracket(String input) {
  List<String> stack = [];
  Map<String, String> bracketPairs = {
    ')': '(',
    '}': '{',
    ']': '[',
  };

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    if (char == '(' || char == '{' || char == '[') {
      stack.add(char);
    } else if (char == ')' || char == '}' || char == ']') {
      if (stack.isEmpty || stack.last != bracketPairs[char]) {
        return 'NO';
      }
      stack.removeLast();
    }
  }

  return stack.isEmpty ? 'YES' : 'NO';
}

void main() {
  String input;

  print('Masukkan string bracket:');
  input = stdin.readLineSync()!.replaceAll(' ', '');

  String result = balancedBracket(input);
  print(result);
}
