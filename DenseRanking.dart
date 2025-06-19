import 'dart:io';

void denseRanking(List<int> playerScores, List<int> gitsScores) {
  List<int> uniqueScores = playerScores.toSet().toList()
    ..sort((b, a) => a.compareTo(b));

  List<int> rankings = [];

  for (int score in gitsScores) {
    int rank = 1;

    while (rank <= uniqueScores.length && score < uniqueScores[rank - 1]) {
      rank++;
    }

    rankings.add(rank);
  }

  print(rankings.join(' '));
}

void main() {
  int players;
  int gitsGames;
  List<int> playerScores = [];
  List<int> gitsScores = [];

  while (true) {
    print('Masukkan jumlah pemain:');
    players = int.tryParse(stdin.readLineSync()!) ?? -1;

    if (players <= 0) {
      print('Jumlah pemain harus lebih dari 0. Input ulang');
    } else {
      break;
    }
  }

  while (true) {
    print('Masukkan skor masing-masing pemain:');
    List<int> inputPlayerScores =
        stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();

    if (inputPlayerScores.length != players) {
      print(
          'Jumlah skor tidak sesuai dengan jumlah pemain ($players). Input ulang');
      continue;
    }

    if (inputPlayerScores.any((score) => score < 0)) {
      print('Skor tidak boleh ada yang negatif. Input ulang');
      continue;
    }

    playerScores = inputPlayerScores;
    break;
  }

  while (true) {
    print('Masukkan jumlah permainan yang diikuti GITS:');
    gitsGames = int.tryParse(stdin.readLineSync()!) ?? -1;

    if (gitsGames <= 0) {
      print('Jumlah permainan harus lebih dari 0. Input ulang');
    } else {
      break;
    }
  }

  while (true) {
    print('Masukkan skor GITS:');
    List<int> inputGitsScores =
        stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();

    if (inputGitsScores.length != gitsGames) {
      print(
          'Jumlah skor tidak sesuai dengan jumlah permainan ($gitsGames). Input ulang');
      continue;
    }

    if (inputGitsScores.any((score) => score < 0)) {
      print('Skor tidak boleh ada yang negatif. Input ulang');
      continue;
    }

    gitsScores = inputGitsScores;
    break;
  }

  print('Ranking yang didapat GITS:');
  denseRanking(playerScores, gitsScores);
}
