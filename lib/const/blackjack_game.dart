// ignore_for_file: non_constant_identifier_names, unused_element, no_leading_underscores_for_local_identifiers, unused_field, prefer_final_field, camel_case_types

import 'package:flutter/material.dart';

class blackjackGameState extends ChangeNotifier {
  final _suits = [
    [
      '🂡',
      '🂢',
      '🂣',
      '🂤',
      '🂥',
      '🂦',
      '🂧',
      '🂨',
      '🂩',
      '🂪',
      '🂫',
      '🂬',
      '🂭',
      '🂮'
    ], // Spades
    [
      '🂱',
      '🂲',
      '🂳',
      '🂴',
      '🂵',
      '🂶',
      '🂷',
      '🂸',
      '🂹',
      '🂺',
      '🂻',
      '🂼',
      '🂽',
      '🂾'
    ], // Hearts
    [
      '🃁',
      '🃂',
      '🃃',
      '🃄',
      '🃅',
      '🃆',
      '🃇',
      '🃈',
      '🃉',
      '🃊',
      '🃋',
      '🃌',
      '🃍',
      '🃎'
    ], // Diamonds
    [
      '🃑',
      '🃒',
      '🃓',
      '🃔',
      '🃕',
      '🃖',
      '🃗',
      '🃘',
      '🃙',
      '🃚',
      '🃛',
      '🃜',
      '🃝',
      '🃞'
    ], // Clubs
  ];
  List<String> deck = [];
  List<String> playerCards = [];
  List<String> dealerCards = [];
  int playerScore = 0;
  int dealerScore = 0;
  static bool gameOver = false;
  static bool jjj = false;
  void initializeGame() {
    deck = _suits.expand((suit) => suit).toList();
    deck.shuffle();
    playerCards = [deck.removeLast(), deck.removeLast()];
    dealerCards = [deck.removeLast(), deck.removeLast()];
    playerScore = handValue(playerCards);
    dealerScore = handValue(dealerCards);
    notifyListeners();
  }

  int get valuePlayer => playerScore;
  int get valueDealer => dealerScore;

  int handValue(List<String> cards) {
    int score = 0;
    int aces = 0;
    for (String card in cards) {
      switch (card) {
        case '🂡':
        case '🂱':
        case '🃁':
        case '🃑':
          score += 1;
          break;
        case '🂢':
        case '🂲':
        case '🃂':
        case '🃒':
          score += 2;
          break;
        case '🂣':
        case '🂳':
        case '🃃':
        case '🃓':
          score += 3;
          break;
        case '🂤':
        case '🂴':
        case '🃄':
        case '🃔':
          score += 4;
          break;
        case '🂥':
        case '🂵':
        case '🃅':
        case '🃕':
          score += 5;
          break;
        case '🂦':
        case '🂶':
        case '🃆':
        case '🃖':
          score += 6;
          break;
        case '🂧':
        case '🂷':
        case '🃇':
        case '🃗':
          score += 7;
          break;
        case '🂨':
        case '🂸':
        case '🃈':
        case '🃘':
          score += 8;
          break;
        case '🂩':
        case '🂹':
        case '🃉':
        case '🃙':
          score += 9;
          break;
        case '🂪':
        case '🂺':
        case '🃊':
        case '🃚':
          score += 10;
          break;
        case '🂫':
        case '🂻':
        case '🃋':
        case '🃛':
          score += 10;
          break;
        case '🂬':
        case '🂼':
        case '🃌':
        case '🃜':
          score += 10;
          break;
        case '🂭':
        case '🂽':
        case '🃍':
        case '🃝':
          score += 10;
          break;
        case '🂮':
        case '🂾':
        case '🃎':
        case '🃞':
          score += 11;
          aces++;
          break;
      }
    }

    while (score > 21 && aces > 0) {
      score -= 10;
      aces--;
    }

    return score;
  }

  void stand() {
    if (blackjackGameState.gameOver) return;
    while (dealerScore < 17) {
      dealerCards.add(deck.removeLast());
      dealerScore = handValue(dealerCards);
    }
    blackjackGameState.gameOver = true;
  }

  void hit() {
    if (blackjackGameState.gameOver) return;
    playerCards.add(deck.removeLast());
    playerScore = handValue(playerCards);
    if (playerScore > 21) {
      blackjackGameState.gameOver = true;
      jjj = false;
    }
  }

  void resetGame() {
    playerCards = [];
    dealerCards = [];
    blackjackGameState.gameOver = false;
    notifyListeners();
  }
}
