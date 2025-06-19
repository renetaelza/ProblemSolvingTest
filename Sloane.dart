import 'dart:io';

List<int> sloane(int n) {
  List<int> result = [];

  for (int i = 0; i < n; i++) {
    int value = (i * (i + 1)) ~/ 2 + 1;
    result.add(value);
  }

  return result;
}

void main() {
  int n = int.parse(stdin.readLineSync()!);

  List<int> hasil = sloane(n);

  print("Output : ${hasil.join('-')}");
}
