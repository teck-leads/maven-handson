package com.techleasds.app;

import java.util.Arrays;
import java.util.Scanner;

public class GenExecutableUberJarAnagramApplication {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		System.out.println("Wanna check if your strings are anagrams???");
		System.out.print("Enter String1 : ");
		// Get user input in str1
		String str1 = scan.nextLine();

		System.out.print("Enter String2 : ");
		// Get user input in str2
		String str2 = scan.nextLine();
		scan.close();
		boolean status = isAnagram(str1, str2);

		if (status) {
			System.out.println("Whoa!!!! " + str1 + " is a perfect anagram of " + str2);

		} else {

			System.out.println("Oh no!!! " + str1 + " and " + str2 + " do not match up to be Anagrams");

		}

	}

	public static boolean isAnagram(String s1, String s2) {

		String copyOfs1 = s1.replaceAll("\\s", "");

		String copyOfs2 = s2.replaceAll("\\s", "");

		// Initially setting status as true

		boolean status = true;

		if (copyOfs1.length() != copyOfs2.length()) {
			// Setting status as false if copyOfs1 and copyOfs2 doesn't have same length

			status = false;
		} else {
			// Changing the case of characters of both copyOfs1 and copyOfs2 and converting
			// them to char array

			char[] s1Array = copyOfs1.toLowerCase().toCharArray();

			char[] s2Array = copyOfs2.toLowerCase().toCharArray();

			// Sorting both s1Array and s2Array

			Arrays.sort(s1Array);

			Arrays.sort(s2Array);

			// Checking whether s1Array and s2Array are equal

			status = Arrays.equals(s1Array, s2Array);
		}

		return status;
	}

}
