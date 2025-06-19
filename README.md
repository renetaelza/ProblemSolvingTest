# ProblemSolvingTest

Ketika menjalankan sebuah program atau algoritma, penting untuk mengukur seberapa cepat program itu jalan (time complexity) dan seberapa banyak memori yang dipakai saat program berjalan (space complexity). Time Complexity adalah cara untuk mengukur banyak langkah atau operasi yang harus dilakukan oleh algoritma seiring bertambahnya ukuran data, tujuannya untuk mengetahui seberapa cepat algoritma bekerja kalau data jadi banyak. Sedangkan Space Complexity adalah cara untuk mengukur seberapa banyak ruang atau memori yang dipakai algoritma selama program berjalan, tujuannya untuk mengetahui apakah program menggunakan banyak memori atau tidak saat dijalankan.

Untuk soal nomor 3, berikut adalah time complexitynya:

import 'dart:io';

String balancedBracket(String input) {
// O(1) (Pemberian nilai pada variabel)
List<String> stack = [];

// O(1) (Pemberian nilai pada variabel)
Map<String, String> bracketPairs = {
')': '(',
'}': '{',
']': '[',
};

// O(n) (Looping)
for (int i = 0; i < input.length; i++) {
// O(1) (Pemberian nilai pada variabel)
String char = input[i];

    // O(1) (Pernyataan IF)
    if (char == '(' || char == '{' || char == '[') {
      stack.add(char); // O(1) time, O(1) space per push (max O(n) jika semua pembuka)
    }
    // O(1) (Pernyataan IF)
    else if (char == ')' || char == '}' || char == ']') {
      // O(1) (Pernyataan IF)
      if (stack.isEmpty || stack.last != bracketPairs[char]) {
        return 'NO'; // O(1)
      }
      stack.removeLast(); // O(1) time
    }

}

// O(1)
return stack.isEmpty ? 'YES' : 'NO';
}

void main() {
String input;

print('Masukkan string bracket:');
input = stdin.readLineSync()!.replaceAll(' ', '');

String result = balancedBracket(input);
print(result);
}

Maka kesimpulannya untuk function balancedBracket:
Time Complexity = O(1)+O(1)+O(n)+O(1)+O(1)+O(1)+O(1)+O(1)+O(1)+O(1)+O(1)+O(1) = O(n) karena O(n) lebih dominan dibanding O(1).
Space Complexity = O(n) karena stack bisa menyimpan hingga n elemen di kasus terburuk saat inputnya panjang
