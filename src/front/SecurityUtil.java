package front;

import java.security.MessageDigest;

public class SecurityUtil {

    public static String hashPassword(String plain) {
        if (plain == null || plain.trim().isEmpty()) {
            return "";
        }
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(plain.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException("SHA-256 algorithm not available", e);
        }
    }

    public static boolean verify(String plain, String storedHash, String storedPlain) {
        if (plain == null) return false;
        String hashed = hashPassword(plain);
        if (storedHash != null && !storedHash.isEmpty() && storedHash.equalsIgnoreCase(hashed)) {
            return true;
        }
        if (storedPlain != null && storedPlain.equals(plain)) {
            return true;
        }
        return false;
    }
}