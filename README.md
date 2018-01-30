# Ranking Poker hands

This program compares two Poker hands and tells you which has a higher score.

## Example usage:

A card is described by two characters.

For example, `["AS", "KD", "TH", "JC", "QH"]` is a hand with:
  - an Ace of spades,
  - a King of diamonds,
  - a Ten of hearts,
  - a Jack of clubs,
  - and a Queen of hearts.

Another hand, `["2C", "5D", "9S", "3H", "TS"]`:
  - 2 of clubs,
  - 5 of diamonds,
  - 9 of spades,
  - 3 of hearts,
  - ten of spades.

You can use the `compare` file from the command line.

```
$ bin/compare "2S 2D 3S 4S 5S" "AS QS JD TS 9S"
Hand 1: ["2S", "2D", "3S", "4S", "5S"] Winner!
Hand 2: ["AS", "QS", "JD", "TS", "9S"]
```
