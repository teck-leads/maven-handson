package com.techleasds.app;

import static org.junit.Assert.*;

import org.junit.Test;


public class GenExecutableUberJarAnagramApplicationTest {

	 @Test
	    public void testGenExecutableUberJarAnagramApplication_sentence1()
	    {
	    	GenExecutableUberJarAnagramApplication ang = new GenExecutableUberJarAnagramApplication();
	        String str1 = "Two plus eleven";
	        String str2 = "One plus twelve";
	        assertTrue(GenExecutableUberJarAnagramApplication.isAnagram(str1,str2));
	    }

	    @Test
	    public void testGenExecutableUberJarAnagramApplication_sentence2()
	    {
	    	GenExecutableUberJarAnagramApplication ang = new GenExecutableUberJarAnagramApplication();
	        String str1 = "The eyes";
	        String str2 = "They See";
	        assertTrue(GenExecutableUberJarAnagramApplication.isAnagram(str1,str2));
	    }

	    @Test
	    public void testGenExecutableUberJarAnagramApplication_words()
	    {
	    	GenExecutableUberJarAnagramApplication ang = new GenExecutableUberJarAnagramApplication();
	        String str1 = "listen";
	        String str2 = "silent";
	        assertTrue(GenExecutableUberJarAnagramApplication.isAnagram(str1,str2));
	    }

	    @Test
	    public void testGenExecutableUberJarAnagramApplication_wordnsentence()
	    {
	    	GenExecutableUberJarAnagramApplication ang = new GenExecutableUberJarAnagramApplication();
	        String str1 = "dormitory";
	        String str2 = "Dirty Room";
	        assertTrue(GenExecutableUberJarAnagramApplication.isAnagram(str1,str2));
	    }

	    @Test
	    public void testGenExecutableUberJarAnagramApplication_negative1()
	    {
	    	GenExecutableUberJarAnagramApplication ang = new GenExecutableUberJarAnagramApplication();
	        String str1 = "I am an GenExecutableUberJarAnagramApplication";
	        String str2 = "I am a GenExecutableUberJarAnagramApplication";
	        assertFalse(GenExecutableUberJarAnagramApplication.isAnagram(str1,str2));
	    }

	     @Test
	    public void testGenExecutableUberJarAnagramApplication_negative2()
	    {
	    	GenExecutableUberJarAnagramApplication ang = new GenExecutableUberJarAnagramApplication();
	        String str1 = "Hero";
	        String str2 = "Zero";
	        assertFalse(GenExecutableUberJarAnagramApplication.isAnagram(str1,str2));
	    }

}
