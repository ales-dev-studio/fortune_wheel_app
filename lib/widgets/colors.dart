import 'dart:ui';

final List<String> colors = [
  '#fc5c65',
  '#fed330',
  '#26de81',
  '#2bcbba',
  '#fd9644',
  '#4b7bec',
  '#a55eea',
  '#0fb9b1',
  '#45aaf2',
  '#FEA47F',
  '#574b90',
  '#778beb',
  '#B33771',
  '#FC427B',
  '#BDC581',
  '#D6A2E8',
  '#00b894',
  '#d63031',
  '#0984e3',
  '#a29bfe',
  '#C2185B',
  '#F44336',
  '#E91E63',
  '#512DA8',
  '#FF5722',
  '#CDDC39',
  '#009688',
  '#795548',
  '#7B1FA2',
  '#4CAF50',
  '#388E3C',
  '#C8E6C9',
];

Color hexToColor(final String colorCode) {
  return Color(
    int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000,
  );
}
