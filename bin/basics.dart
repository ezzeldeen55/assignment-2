import 'dart:io';

// ---------- Helpers ----------
int readInt() => int.parse(stdin.readLineSync()!.trim());

List<int> readInts() =>
    stdin.readLineSync()!.trim().split(RegExp(r'\s+')).map(int.parse).toList();

// ---------- 1) Sum of natural numbers up to n ----------
void ex1() {
  int n = readInt();
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    stdout.write('$i ');
    sum += i;
  }
  print('\nThe Sum of Natural Number upto $n terms : $sum');
}

// ---------- 2) Multiplication table up to 10 ----------
void ex2() {
  int n = readInt();
  for (int i = 1; i <= 10; i++) {
    print('$n x $i = ${n * i}');
  }
}

// ---------- 3) First n odd numbers and their sum ----------
void ex3() {
  int n = readInt();
  int sum = 0;
  stdout.write('The odd numbers are: ');
  for (int i = 1; i <= n; i++) {
    int odd = 2 * i - 1;
    stdout.write('$odd ');
    sum += odd;
  }
  print('\nThe Sum of odd Natural Numbers upto $n terms: $sum');
}

// ---------- 4) Count positive, negative and zeros ----------
void ex4() {
  print('How many Number you want to check ?');
  int n = readInt();
  print('Enter $n numbers');
  List<int> nums = readInts();

  int pos = 0, neg = 0, zero = 0;
  for (int i = 0; i < n; i++) {
    if (nums[i] > 0) {
      pos++;
    } else if (nums[i] < 0) {
      neg++;
    } else {
      zero++;
    }
  }
  print('You Entered $pos postive numbers And $neg negative and $zero Zero');
}

// ---------- 5) Factorial ----------
void ex5() {
  int n = readInt();
  int fact = 1;
  for (int i = 1; i <= n; i++) {
    fact *= i;
  }
  print(fact);
}

// ---------- 6) Reverse digits ----------
void ex6() {
  int n = readInt();
  int rev = 0;
  while (n > 0) {
    int digit = n % 10;
    rev = rev * 10 + digit;
    n = n ~/ 10;
  }
  print(rev);
}

// ---------- 7) Numbers 100..1000 divisible by 5 and 6 ----------
void ex7() {
  List<int> result = [];
  for (int i = 100; i <= 1000; i++) {
    if (i % 5 == 0 && i % 6 == 0) {
      result.add(i);
    }
  }
  print(result.join(' '));
}

// ---------- 8) Prime number ----------
void ex8() {
  int n = readInt();
  bool isPrime = n >= 2;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      isPrime = false;
      break;
    }
  }
  print(isPrime ? 'yes' : 'no');
}

// ---------- 9) Power without built-in functions ----------
void ex9() {
  stdout.write('Enter base: ');
  int base = readInt();
  stdout.write('Enter exponent: ');
  int exp = readInt();

  int result = 1;
  for (int i = 0; i < exp; i++) {
    result *= base;
  }
  print(result);
}

// ---------- 10) Max and Min ----------
void ex10() {
  print('How many numbers?');
  int n = readInt();
  print('Enter $n numbers:');
  List<int> nums = readInts();

  int max = nums[0];
  int min = nums[0];
  for (int i = 1; i < n; i++) {
    if (nums[i] > max) max = nums[i];
    if (nums[i] < min) min = nums[i];
  }
  print('Max number is $max');
  print('Min number is $min');
}

// ---------- Menu ----------
void main() {
  final exercises = <int, void Function()>{
    1: ex1,
    2: ex2,
    3: ex3,
    4: ex4,
    5: ex5,
    6: ex6,
    7: ex7,
    8: ex8,
    9: ex9,
    10: ex10,
  };

  while (true) {
    print('\n===== Route Exercises =====');
    print('Choose exercise number (1-10), or 0 to exit:');
    int choice = readInt();

    if (choice == 0) {
      print('Bye!');
      break;
    }

    final run = exercises[choice];
    if (run == null) {
      print('Invalid choice, try again.');
    } else {
      print('--- Exercise $choice ---');
      run();
    }
  }
}