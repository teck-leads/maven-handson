package com.techleasds.app;

public class MavenExecPluginFibonaciiApplication {
	/*
	 * Generate comma separated prime numbers from first 10 fibonacii series and
	 * also calculate the sum of generated prime numbers
	 */

	public static void main(String[] args) {
		int d = 10;
		int fibo[] = new int[d];
		int a = 0, b = 1, c, sum = 0;
		fibo[0] = a;
		fibo[1] = b;
		String primes = "";
		// insert your code here
		for (int i = 2; i < fibo.length; ++i) {
			c = a + b;
			fibo[i] = c;
			a = b;
			b = c;
		}
		
		for (int i : fibo) {
			boolean prime = checkPrimeNumber(i);
			if (prime && i != 1) {
				primes = primes + i + ",";
				sum = sum + i;
			}

		}

		primes=primes.substring(0, primes.length()-1);
		System.out.println(primes);
		System.out.println(sum);
	}

	private static boolean checkPrimeNumber(int num) {
		boolean primeFlag = true;
		for (int i = 2; i <= num / 2; i++) {
			if (num % i == 0) {
				primeFlag = false;
				break;
			}
		}
		return (primeFlag == true) ? true : false;
	}
}
