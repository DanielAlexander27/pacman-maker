import 'dart:math';

class SystemConverter {
  static String decToBinary(int decimal, int numBits) {
    final result = decToAnySystem(decimal, 2);

    return (result.length < numBits)
        ? result.padLeft(numBits, '0')
        : result.substring(0, numBits);
  }

  static String binaryToHex(String binary) {
    final decimal = binaryToDec(binary);

    final result = decToAnySystem(
      decimal,
      16,
      decimalInterpretation: (decimal) {
        if (decimal == 10) return 'A';
        if (decimal == 11) return 'B';
        if (decimal == 12) return 'C';
        if (decimal == 13) return 'D';
        if (decimal == 14) return 'E';
        if (decimal == 15) return 'F';

        return decimal.toString();
      },
    );

    return result;
  }

  static String decToHex(int decimal) {
    return decToAnySystem(
      decimal,
      16,
      decimalInterpretation: (decimal) {
        if (decimal == 10) return 'A';
        if (decimal == 11) return 'B';
        if (decimal == 12) return 'C';
        if (decimal == 13) return 'D';
        if (decimal == 14) return 'E';
        if (decimal == 15) return 'F';

        return decimal.toString();
      },
    );
  }

  static String decToAnySystem(
    int decimal,
    int systemToConvert, {
    String Function(int)? decimalInterpretation,
  }) {
    StringBuffer conversion = StringBuffer();

    while (decimal != 0) {
      final digitTransformed = decimal % systemToConvert;

      conversion.write(
        decimalInterpretation != null
            ? decimalInterpretation(digitTransformed)
            : digitTransformed,
      );

      decimal ~/= systemToConvert;
    }

    return conversion.toString().split('').reversed.join('');
  }

  static int binaryToDec(String binary) {
    int decimal = 0;

    for (int i = binary.length - 1; i >= 0; i--) {
      if (int.parse(binary[binary.length - i - 1]) == 0) continue;

      decimal += pow(2, i).toInt();
    }

    return decimal;
  }
}

// main() {
//   // print(SystemConverter.decToBinary(300, 7).toString());
//   print(SystemConverter.binaryToDec("0111110000000000").toString());
//   print(SystemConverter.binaryToHex("0111110000000000").toString());
// }
