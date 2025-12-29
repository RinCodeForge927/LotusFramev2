package rin.dev.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class SecurityHelper {

    /**
     * Hash a password using SHA-256.
     * In a real production app, consider using BCrypt, but SHA-256 is a 
     * significant improvement over plaintext and requires no extra libraries.
     */
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error: SHA-256 algorithm not found", e);
        }
    }

    /**
     * Generate a random CSRF token.
     */
    public static String generateCsrfToken() {
        byte[] randomBytes = new byte[32];
        new java.security.SecureRandom().nextBytes(randomBytes);
        return Base64.getEncoder().encodeToString(randomBytes);
    }
}
