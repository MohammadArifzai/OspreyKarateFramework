package data;

import java.util.Random;

public class DataGenerator {

    public static String getEmail() {
        String prefix = "mohammadE124";
        String emailProvider = "@gmail.com";

        Random random = new Random();
        int randomNumber = random.nextInt(10000);

        return prefix + randomNumber + emailProvider;

    }
}
