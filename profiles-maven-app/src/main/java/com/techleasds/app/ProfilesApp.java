package com.techleasds.app;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ProfilesApp {

	public static void main(String[] args) {

		ProfilesApp app = new ProfilesApp();
		Properties prop = app.loadPropertiesFile("config.properties");
		prop.forEach((k, v) -> System.out.println(k + ":" + v));

	}

	public Properties loadPropertiesFile(String filePath) {

		Properties prop = new Properties();

		try (InputStream resourceAsStream = getClass().getClassLoader().getResourceAsStream(filePath)) {
			prop.load(resourceAsStream);
		} catch (IOException e) {
			System.err.println("Unable to load properties file : " + filePath);
		}

		return prop;

	}

}
