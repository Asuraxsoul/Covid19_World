import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Quote {
  final int index;
  final String dailyQuote;
  final String author;

  Quote({
    this.index,
    this.dailyQuote,
    this.author,
  });

  static String getAuthor() {
    int now = DateTime.now().weekday;
    int multiplier = DateTime.now().hour + 1;
    if (multiplier <= 12) {
      multiplier = 1;
    } else {
      multiplier = 2;
    }
    return quotes[now * multiplier - 1].author;
  }

  static String getQuote() {
    int now = DateTime.now().weekday;
    int multiplier = DateTime.now().hour + 1;
    if (multiplier <= 12) {
      multiplier = 1;
    } else {
      multiplier = 2;
    }
    return quotes[now * multiplier - 1].dailyQuote;
  }
}

List quotes = [
  Quote(
    index: 1,
    dailyQuote:
        "Success is not final; \nFailure is not final; \nIt is the Courage to Continue that counts.",
    author: "WINSTON CHURCHILL",
  ),
  Quote(
    index: 2,
    dailyQuote: "We may Encounter many Defeats but \nWe Must Not be Defeated.",
    author: "MAYA ANGELOU",
  ),
  Quote(
    index: 3,
    dailyQuote:
        "Imagine your Life is Perfect in every respect; \nWhat would it look like?",
    author: "BRIAN TRACY",
  ),
  Quote(
    index: 4,
    dailyQuote: "We generate fears while we Sit. \nWe overcome them by Action.",
    author: "DR. HENRY LINK",
  ),
  Quote(
    index: 5,
    dailyQuote:
        "The man who has Confidence in himself \ngains the Confidence of others.",
    author: "HASIDIC PROVERB",
  ),
  Quote(
    index: 6,
    dailyQuote:
        "What you lack in Talent can be made up with \nDesire, Hustle and giving 110% all the time.",
    author: "DON ZIMMER",
  ),
  Quote(
    index: 7,
    dailyQuote: "Do what you can with All you have, \nwherever you are.",
    author: "THEODORE ROOSEVELT",
  ),
  Quote(
    index: 8,
    dailyQuote:
        "The Pessimist sees Difficulty in every Opportunity. \nThe Optimist sees Opportunity in every Difficulty.",
    author: "WINSTON CHURCHILL",
  ),
  Quote(
    index: 9,
    dailyQuote:
        "Develop an 'Attitude of Gratitude'. \nSay Thank You to everyone you meet for everything they do for you.",
    author: "BRIAN TRACY",
  ),
  Quote(
    index: 10,
    dailyQuote: "To see what is right and not do it is a lack of Courage.",
    author: "CONFUCIUS",
  ),
  Quote(
    index: 11,
    dailyQuote:
        "For every reason it's not possible, \nthere are hundreds of people who have faced the same circumstances \nand Succeeded.",
    author: "JACK CANFIELD",
  ),
  Quote(
    index: 12,
    dailyQuote:
        "You don't have to be Great to Start, \nbut you have to Start to be Great.",
    author: "ZIG ZIGLAR",
  ),
  Quote(
    index: 13,
    dailyQuote: "You don't have to have it all figured out to move forward.",
    author: "UNKNOWN",
  ),
  Quote(
    index: 14,
    dailyQuote: "More is lost by Indecision than Wrong decision.",
    author: "MARCUS TULLIUS CICERO",
  ),
];
