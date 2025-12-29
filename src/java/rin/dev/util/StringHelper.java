package rin.dev.util;

import java.security.SecureRandom;

public class StringHelper {

    private static final String ALPHANUMERIC = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final String NUMERIC = "0123456789";
    private static final SecureRandom RANDOM = new SecureRandom();

    /**
     * Generate a random alphanumeric string.
     *
     * @param len the desired length of the output string
     * @return random string containing A–Z, a–z, and digits
     */
    public static String randomString(int len) {
        return randomFromSource(ALPHANUMERIC, len);
    }

    /**
     * Generate a random numeric string (digits only).
     *
     * @param len the desired length of the output string
     * @return random string containing digits 0–9
     */
    public static String randomNumberString(int len) {
        return randomFromSource(NUMERIC, len);
    }

    /**
     * Internal helper method used to generate random strings based on a given
     * character source.
     */
    private static String randomFromSource(String source, int len) {
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(source.charAt(RANDOM.nextInt(source.length())));
        }
        return sb.toString();
    }

    /**
     * Capitalize the first character of a string (useful when displaying
     * names).
     *
     * @param input original text
     * @return the same string with its first character uppercased
     */
    public static String capitalizeFirst(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        return input.substring(0, 1).toUpperCase() + input.substring(1);
    }

    /**
     * Placeholder for sanitizing input parameters. Should be implemented later
     * if needed (e.g., HTML escaping, trimming).
     */
    public static String sanitize(String parameter) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
